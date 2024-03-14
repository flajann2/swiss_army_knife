defmodule SwissArmyKnife do
  @moduledoc """
  Documentation for `SwissArmyKnife`.
  """
  import IO
  #import Optimus

  #alias Optimus, as: Cli
  
  use Application
  
  @doc """
  TODO: Document!
  """
  def start(_type, args \\ []) do
    #args |> Cli.parse_args |> process
    puts "\n*** start called ***\n"
    puts args
  end

  def main(args \\ []) do
    puts "\n*** main called ***\n"
    puts args
  end

  def process() do
  end

  def process(%Optimus.ParseResult{}) do
    puts "No arguments given"
    :error
  end  

end
