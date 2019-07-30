# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :awesome_toolbox,
  ecto_repos: [AwesomeToolbox.Repo]

# Configures the endpoint
config :awesome_toolbox, AwesomeToolboxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1uGQP+sIuUMvQoTFaMeBL028rGx0mO9EwWkEbaSRPK4B3G8XwVV7vRx62kg/TEEd",
  render_errors: [view: AwesomeToolboxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AwesomeToolbox.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :awesome_toolbox,
  github_api: AwesomeToolbox.Github

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
