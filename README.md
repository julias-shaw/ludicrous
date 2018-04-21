# Ludicrous

The ludicrous plugin takes the extreme practice of continuous delivery to a new extreme... perhaps even a ludicrous one.

Every time a file is saved the unit test suite is run and, if the tests pass, the code is committed and pushed to git. Ideally this will trigger a continuous delivery server to validate the code and push it to production. In actual usage this has resulted in 20-50 production releases per hour.

Currently this approach, and this plugin, are designed to work on projects with only a single committer.

## Installation

  1. Add `ludicrous` along with `test.watch` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ludicrous, github: "julias-shaw/ludicrous", only: [:dev, :test]},
    {:mix_test_watch, "~> 0.2.6", only: :dev},
  ]
end
```

  2. Ensure `ludicrous` is started before your application:

```elixir
def application do
  [applications: [:ludicrous]]
end
```

  3. Configure `test.watch` to run stale tests and invoke the ludicrous plugin after a successful test run.

```elixir
config :mix_test_watch,
  tasks: [
    "test --stale",
    "ludicrous",
  ]
```

  4. Optionally configure your remote repo to check network availability and a custom commit message. The remote repo defaults to github.com so you do not need to set it if that is where your repo lives. The commit message defaults to "Ludicrous mode commit!" if you don't configure something else.

```elixir
config :ludicrous,
  commit_message: "Custom commit message goes here",
  domain: "example.com"
```
