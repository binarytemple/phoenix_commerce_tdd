defmodule PhoenixCommerce.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_commerce,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PhoenixCommerce, []},
      applications: applications(Mix.env)
    ]
  end

  defp applications(:test) do
    [:hound | applications(:dev)]
  end

  defp applications(_) do
     [:phoenix, :phoenix_html, :cowboy, :logger, :gettext,
      :phoenix_ecto, :postgrex, :ex_aws, :httpoison, :stripity_stripe]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.1.4"},
      {:phoenix_ecto, "~> 2.0"},
      {:postgrex, "~> 0.11.0", [optional: true, hex: :postgrex]},
      {:phoenix_html, "~> 2.4"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.9"},
      {:cowboy, "~> 1.0"},
      {:hound, "~> 0.8.2", only: [:test,:dev]},
      {:arc, "~> 0.2.2"},
      {:arc_ecto, "~> 0.3.1"},
      {:ex_aws, "~> 0.4.10"},
      {:httpoison, "~> 0.7"},
      {:stripity_stripe, "~> 1.2.0"}
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
