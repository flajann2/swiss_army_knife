defmodule SwissArmyKnife.MixProject do
  use Mix.Project

  def project do
    [
      app: :swiss_army_knife,
      version: "0.0.1",
      elixir: "~> 1.16",
      escript:
      [
        main_module: SwissArmyKnife.CLI,
        name: "sak",
        path: "./bin/sak"
      ], 
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # releases: [
      #   sak: [
      #     include_executables_for: [:unix],
      #     applications: [runtime_tools: :permanent]
      #   ]
      # ]
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
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [
            macos: [os: :darwin, cpu: :x86_64],
            linux: [os: :linux, cpu: :x86_64],
          ]
        ]
      ]
    ]
  end
end
