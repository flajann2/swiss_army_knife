defmodule SwissArmyKnife do
  @moduledoc """
  Documentation for `SwissArmyKnife`.
  """
  import IO

  alias SAK.Cli
  
  @doc """
  TODO: Document!
  """
  def main(args) do
    args |> Cli.parse_args |> process
  end

  def process() do
  end

  def process(%Optimus.ParseResult{}) do
    puts "No arguments given"
    :error
  end  

end
