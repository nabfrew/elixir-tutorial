defmodule KV.MixProject do
  use Mix.Project

  def project do
    [
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      app: :kv,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {KV, []}
    ]
  end

  def deps do
    [{:plug, "~> 1.0"}]
  end
end
