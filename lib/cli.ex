defmodule CLI do
  #import IO

  alias Optimus, as: Cli
  alias SwissArmyKnife, as: Pro

  def main(args) do
    Cli.new!(
      name: "sak",
      description: "Swiss Army Knife -- Many useful functions for the hacker in all of us.",
      version: "0.0.0",
      author: "Fred Mitchell fred.mitchell@atomlogik.de",
      about: "Many useful utilities, such as getting your external IP address, installed kernel, etc.",
      allow_unknown_args: false,
      parse_double_dash: true,
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
        extip: [
          name: "extip",
          about: "Get your Internet-facing IP and general location.",
                  ],
        kernel: [
          name: "kernel",
          about: "Check your running kernel against the newly installed ones",
        ],
        
      ]
    ) |> Cli.parse!(args) |> Pro.process |> IO.inspect 
  end

end

