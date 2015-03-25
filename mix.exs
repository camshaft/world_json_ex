defmodule WorldJson.Mixfile do
  use Mix.Project

  def project do
    [app: :world_json,
     version: "0.1.1",
     elixir: "~> 1.0",
     description: "topojson country and state/province collections for elixir/erlang",
     package: package,
     deps: deps]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [{ :poison, "~> 1.3.1" }]
  end

  defp package do
    [files: ["src", "mix.exs", "README*"],
     contributors: ["Cameron Bytheway"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/camshaft/world_json_ex"}]
  end
end
