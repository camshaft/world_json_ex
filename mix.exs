defmodule WorldJson.Mixfile do
  use Mix.Project

  def project do
    :application.set_env(:world_json, :geo_files, :erlang.binary_to_list(Mix.Project.deps_path))
    [app: :world_json,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{ :poison, "~> 1.3.1" },
     { :world_geo_json, github: "johan/world.geo.json", compile: false, app: false }]
  end
end
