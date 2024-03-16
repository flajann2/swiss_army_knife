defmodule SwissArmyKnife.MixProject do
  use Mix.Project

  def project do
    [
      app: :swiss_army_knife,
      version: "0.0.1",
      elixir: "~> 1.16",
      escript:
      [
        main_module: CLI,
        name: "sak",
        path: "./bin/sak"
      ], 
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end
  
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:optimus, "~> 0.5.0"},
      {:httpoison, "~> 2.2"},
      {:jason, "~> 1.4"},
    ]
  end
end
