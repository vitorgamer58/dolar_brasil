defmodule DolarBrasil.MixProject do
  use Mix.Project

  def project do
    [
      app: :dolar_brasil,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {DolarBrasil.Application, []}
    ]
  end

  defp deps do
    [
      {:bandit, "~> 1.0"},
      {:httpoison, "~> 2.0"}
    ]
  end
end
