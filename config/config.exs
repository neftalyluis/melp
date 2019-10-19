# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :melp,
  ecto_repos: [Melp.Repo]

# Configures the endpoint
config :melp, MelpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "htHRP6F54DPMk+l4GFQniT7RwZqX0Q8CQ+tBjZ6+eA3WB4oMafCKF+u86f3x0BXr",
  render_errors: [view: MelpWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Melp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
