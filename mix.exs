defmodule ExKcal.MixProject do
  use Mix.Project

  def project do
    [
      name: "ExKcal",
      package: package(),
      description: description(),
      app: :ex_kcal,
      version: "0.0.6",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
    ]
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE.txt),
      licenses: ["AGPL-3.0-or-later"],
      links: %{"GitHub" => "https://github.com/filipmnowak/ex_kcal"}
    ]
  end

  defp description() do
    "Handle culinary recipes and calculate their nutritional value (pre-alpha / WIP)."
  end
end
