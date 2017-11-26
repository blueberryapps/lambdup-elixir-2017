# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_workshop_2017,
  ecto_repos: [ElixirWorkshop2017.Repo]

# Configures the endpoint
config :elixir_workshop_2017, ElixirWorkshop2017Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UAZ0weRA6ym1GesZ+GTEk8ia3uOVXNIqaO0y0yL7JpexERdX8hGGMjcETVP1P0KT",
  render_errors: [view: ElixirWorkshop2017Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirWorkshop2017.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
