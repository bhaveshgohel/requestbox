defmodule Requestbox.Mixfile do
  use Mix.Project

  def project do
    [app: :requestbox,
     version: "0.1.0",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     elixirc_options: [warnings_as_errors: true],
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Requestbox, []},
     applications: [:phoenix, :cowboy, :logger, :quantum,
                    :timex, :tzdata,
                    :phoenix_html, :phoenix_ecto, :postgrex, :sqlite_ecto]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.1.5"},
     {:phoenix_html, "~> 2.6.0"},
     {:phoenix_live_reload, "~> 1.0"},
     {:phoenix_ecto, "~> 2.0"},
     {:postgrex, ">= 0.11.0"},
     {:sqlite_ecto, "~> 1.1.0"},
     {:cowboy, "~> 1.0"},
     {:quantum, ">= 1.5.0"},
     {:poison, "~> 1.5"},
     {:timex_ecto, "~> 1.1.0"},
     {:hashids, "~> 2.0"},
     {:scrivener, "~> 1.2"},
     {:scrivener_html, "~> 1.1"},
     {:credo, "~> 0.4", only: [:dev, :test]}
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
