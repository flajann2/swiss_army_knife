defmodule SwissArmyKnife.MixProject do
  use Mix.Project

  def project do
    [
      app: :swiss_army_knife,
      version: "0.0.0",
      elixir: "~> 1.16",
      escript:
      [
        main_module: SwissArmyKnife,
        name: "sak",
        path: "./bin/sak"
      ], 
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end
 
  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {SwissArmyKnife, []},
      extra_applications: [:logger],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:optimus, "~> 0.5.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
