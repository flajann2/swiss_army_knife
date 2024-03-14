defmodule SwissArmyKnife do
  @moduledoc """
  Documentation for `SwissArmyKnife`.
  """
  import IO
  use Application
  
  @doc """
  TODO: Document!
  """
  def start(_type, args) do
    #args |> Cli.parse_args |> process
    puts "\n*** start called ***\n"
    IO.inspect args
    Supervisor.start_link([], strategy: :one_for_one)
  end

  process({[:extip], _}) do
    puts "extip"
  end

  process({[:kernel], _}) do
    puts "kernel"
  end

  def process() do
  end

  def process(%Optimus.ParseResult{}) do
    puts "No arguments given"
    :error
  end  
   
end
