use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_commerce, PhoenixCommerce.Endpoint,
  http: [port: 4001],
  url: [host: (System.get_env("HOST")  ||  
  String.strip :binary.list_to_bin :os.cmd :binary.bin_to_list("/bin/hostname")
  ) ],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_commerce, PhoenixCommerce.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: (System.get_env("postgres_test_username") || raise "can't load config postgres_test_username"),
  password: (System.get_env("postgres_test_password") || raise "can't load config postgres_test_password"),
  database: (System.get_env("postgres_test_database") || raise "can't load config postgres_test_database"),
  hostname: (System.get_env("postgres_test_hostname") || raise "can't load config postgres_test_hostname"),
  port:     (System.get_env("postgres_test_port")     || raise "can't load config postgres_test_port"),
  pool: Ecto.Adapters.SQL.Sandbox

config :hound,
  driver: "chrome_driver",
  host: (System.get_env("chrome_driver_host") || raise "chrome_driver_host"),
  port: (System.get_env("chrome_driver_port") || raise "chrome_driver_port")

