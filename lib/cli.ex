defmodule CLI do
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
        verbosity: [
          short: "-v",
          help: "Verbosity level",
          multiple: true,
          global: true
        ],
      ],
      subcommands: [
        extip: [
          name: "extip",
          about: "Get your Internet-facing IP and general location.",
          flags: [
            ipv6: [
              value_name: "IPV6",
              short: "-i",
              long: "--ipv6",
              multiple: false,
            ],
          ],
        ],
        kernel: [
          name: "kernel",
          about: "Check your running kernel against the newly installed ones",
        ],
        sleep: [
          name: "sleep",
          about: "Put your computer instantly to sleep",
        ],
      ]
    ) |> Cli.parse!(args) |> Pro.process
  end
end
