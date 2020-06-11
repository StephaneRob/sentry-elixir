defmodule Sentry.Mixfile do
  use Mix.Project

  def project do
    [
      app: :sentry,
      version: "7.2.4",
      elixir: "~> 1.7",
      description: "The Official Elixir client for Sentry",
      package: package(),
      deps: deps(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        plt_add_deps: :app_tree,
        plt_add_apps: [:mix, :plug, :hackney]
      ],
      docs: [extras: ["README.md"], main: "readme"],
      xref: [exclude: [:hackney]]
    ]
  end

  def application do
    [
      mod: {Sentry, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:hackney, "~> 1.8 or 1.6.5", optional: true},
      {:jason, "~> 1.1", optional: true},
      {:plug, "~> 1.6", optional: true},
      {:plug_cowboy, "~> 1.0 or ~> 2.0", optional: true},
      {:phoenix, "~> 1.3", optional: true},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.21.0", only: :dev},
      {:bypass, "~> 1.0", only: [:test]}
    ]
  end

  defp package do
    [
      files: ["lib", "LICENSE", "mix.exs", "README.md"],
      maintainers: ["Mitchell Henke", "Jason Stiebs"],
      licenses: ["MIT"],
      links: %{
        "github" => "https://github.com/getsentry/sentry-elixir"
      }
    ]
  end
end
