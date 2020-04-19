# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :manage,
  ecto_repos: [Manage.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :manage, ManageWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2aYXhrwP2cHjKJ40lwF7fHgLiYZQESVoPH/8AdyOL4bmAEpJ2qCtOKC0s11kYP2f",
  render_errors: [view: ManageWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Manage.PubSub,
  live_view: [signing_salt: "ugI2NxCo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
