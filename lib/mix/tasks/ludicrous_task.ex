defmodule Mix.Tasks.Ludicrous do
  use Mix.Task

  @shortdoc "Ludicrous mode commits and pushes automatically."
  def run(_) do
    IO.puts "Ludicrous Mode Engaged!"
    IO.puts "Mix Enviroment = #{Mix.env}"
    System.cmd("git", ["add", "-A"])
    System.cmd("git", ["commit", "-m", "Ludicrous mode commit!"])
    {_, result_code } = System.cmd("ping", ["-c", "1", "-q", "github.com"])
    case result_code do
      0 -> System.cmd("git", ["push", "origin", "master"])
      _ -> IO.puts("Network not available - Not pushing :(")
    end
  end
end
