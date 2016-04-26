# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phoenix_commerce, PhoenixCommerce.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "IZZlMmKrXSofsOkRR6pzubKweHFVC6mxU4YoEhzPFyrzgkFBdkDkDnH2L6n7Xw2V",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: PhoenixCommerce.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :arc,
  bucket: "binarytemple-phoenix-commerce",
  virtual_host: true

config :ex_aws,
  access_key_id: (System.get_env("PHOENIX_COMMERCE_AWS_ACCESS_KEY_ID") || raise "missing env var PHOENIX_COMMERCE_AWS_ACCESS_KEY_ID"),
  secret_access_key: (System.get_env("PHOENIX_COMMERCE_AWS_SECRET_ACCESS_KEY") || raise "raise missing env var PHOENIX_COMMERCE_AWS_SECRET_ACCESS_KEY"),
  s3: [
    scheme: "https://",
    host: "s3-eu-west-1.amazonaws.com",
    region: "eu-west-1"
  ]

config :stripity_stripe, secret_key: (System.get_env("PHOENIX_COMMERCE_STRIPE_SECRET_KEY") || raise "raise missing env var STRIPE_SECRET_KEY")
