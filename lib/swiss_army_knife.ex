defmodule SwissArmyKnife do
  @moduledoc """
  Documentation for `SwissArmyKnife`.
  """
  import IO
  #import Optimus

  alias Optimus, as: Cli
  
  use Application
  
  @doc """
  TODO: Document!
  """
  def start(_type, args \\ []) do
    #args |> Cli.parse_args |> process
    puts "\n*** start called ***\n"
    IO.inspect args
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main(args) do
    Cli.new!(
      name: "statcalc",
      description: "Statistic metrics calculator",
      version: "1.2.3",
      author: "John Smith js@corp.com",
      about: "Utility for calculating statistic metrics of values read from a file for a certain period of time",
      allow_unknown_args: false,
      parse_double_dash: true,
      args: [
        infile: [
          value_name: "INPUT_FILE",
          help: "File with raw data",
          required: true,
          parser: :string
        ],
        outfile: [
          value_name: "OUTPUT_FILE",
          help: "File to write statistics to",
          required: false,
          parser: :string
        ]
      ],
      flags: [
        print_header: [
          short: "-h",
          long: "--print-header",
          help: "Specifies whether to print header before the outputs",
          multiple: false,
        ],
        verbosity: [
          short: "-v",
          help: "Verbosity level",
          multiple: true,
          global: true
        ],
      ],
      options: [
        date_from: [
          value_name: "DATE_FROM",
          short: "-f",
          long: "--from",
          help: "Start date for the period",
          parser: fn(s) ->
            case Date.from_iso8601(s) do
              {:error, _} -> {:error, "invalid date"}
              {:ok, _} = ok -> ok
            end
          end,
          required: true
        ],
        date_to: [
          value_name: "DATE_TO",
          short: "-t",
          long: "--to",
          help: "End date for the period",
          parser: fn(s) ->
            case Date.from_iso8601(s) do
              {:error, _} -> {:error, "invalid date"}
              {:ok, _} = ok -> ok
            end
          end,
          required: false,
          default: &Date.utc_today/0
        ],
      ],
      subcommands: [
        validate: [
          name: "validate",
          about: "Validates the raw contents of a file",
          args: [
            file: [
              value_name: "FILE",
              help: "File with raw data to validate",
              required: true,
              parser: :string
            ]
          ]
        ]
      ]
    ) |> Cli.parse!(args) |> IO.inspect 
  end

  def process() do
  end

  def process(%Optimus.ParseResult{}) do
    puts "No arguments given"
    :error
  end  
end
