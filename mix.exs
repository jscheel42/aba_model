defmodule AbaModel.Mixfile do
  use Mix.Project

  def project do
    [
      app: :aba_model,
      version: "1.0.0",
      elixir: "~> 1.6",
      name: "AbaModel",
      description: "AbaModel is a database model based on the HOTS API (https://hotsapi.net/).",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
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
      { :ex_doc, "~> 0.18", only: :dev },
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
