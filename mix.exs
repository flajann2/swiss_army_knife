defmodule SwissArmyKnife.MixProject do
  use Mix.Project

  def project do
    [
      app: :swiss_army_knife,
      version: "0.0.1",
      elixir: "~> 1.17.1",
      escript: [
        main_module: SwissArmyKnife.CLI,
        name: "sak",
        path: "./bin/sak",
        embed_elixir: true,
        emu_args: "-noshell"
      ], 
      # env: [escript_script: ".bin/sak"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
    ]
  end
  
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:optimus, "~> 0.5.0"},
      {:httpoison, "~> 2.2"},
      {:jason, "~> 1.4"},
      {:burrito, github: "burrito-elixir/burrito"},
    ]
  end

  def releases do
    [
      sak: [
        include_executables_for: [:unix, :windows],
        applications: [runtime_tools: :permanent],
        steps: [:assemble, &Burrito.wrap/1, :tar],
        burrito: [
          targets: [
            linux:   [os: :linux, cpu: :x86_64],
            macos:   [os: :darwin, cpu: :x86_64],
            windows: [os: :windows, cpu: :x86_64]
          ]
        ]
      ]
    ]
  end
end
