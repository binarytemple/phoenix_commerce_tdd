use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :phoenix_commerce, PhoenixCommerce.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  url: [host: (String.strip :binary.list_to_bin :os.cmd :binary.bin_to_list("/bin/hostname")) ],
  code_reloader: true,
  cache_static_lookup: false,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

# Watch static and templates for browser reloading.
config :phoenix_commerce, PhoenixCommerce.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :phoenix_commerce, PhoenixCommerce.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: (System.get_env("postgres_dev_username") || raise "can't load config postgres_dev_username"),
  password: (System.get_env("postgres_dev_password") || raise "can't load config postgres_dev_password"),
  database: (System.get_env("postgres_dev_database") || raise "can't load config postgres_dev_database"),
  hostname: (System.get_env("postgres_dev_hostname") || raise "can't load config postgres_dev_hostname"),
  port:     (System.get_env("postgres_dev_port")     || raise "can't load config postgres_dev_port"),
  pool_size: 10

config :hound,
  driver: "chrome_driver",
  host: (System.get_env("chrome_driver_host") || raise "chrome_driver_host"),
  port: (System.get_env("chrome_driver_port") || raise "chrome_driver_port")
 
