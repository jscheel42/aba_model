defmodule AbaModel.Mixfile do
  use Mix.Project

  def project do
    [
      app: :aba_model,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {AbaModel.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 2.2.8"},
      {:ecto_enum, "~> 1.0"},
      {:postgrex, "~> 0.13"}
    ]
  end

  defp docs do
    [
      main: "AbaModel",
      extras: ["README.md"],
      output: ["docs"]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Joshua Scheel"],
      links: %{"Github": "https://github.com/jscheel42/aba_model",
               "TravisCI": "https://travis-ci.org/jscheel42/aba_model"}
    ]
  end
end
