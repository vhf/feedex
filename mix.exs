defmodule FeedEx.Mixfile do
  use Mix.Project

  def project do
    [app: :feedex,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [
      :logger,
      :httpoison,
      :feedparser]]
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
    [{:feedparser, github: "vhf/feedparser"},
     {:httpoison, "~> 0.8.1"},
     {:dogma, "~> 0.0", only: :dev},
     {:credo, "~> 0.3", only: [:dev, :test]}]
  end

  defp package do
    [contributors: ["Victor Felder"],
     licenses: ["MIT"],
     description: "Elixir feedparser wrapper.",
     links: %{"GitHub" => "https://github.com/vhf/feedex",
              "feedparser" => "https://github.com/urbanserj/feedparser"}]
  end
end
