# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :requestbox, Requestbox.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "HuiaFVoiGvYFhfAPG/OOMmOI9DV0kAVe4TZVbq1lR3nSWtdeRVmniAFVU+H84aBx",
  pubsub: [name: Requestbox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :hashids,
  salt: "DtALrFb9ZQAghcOrxeE1azn6y5kf3OuZ"

config :scrivener_html,
  routes_helper: Requestbin.Router.Helpers

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
