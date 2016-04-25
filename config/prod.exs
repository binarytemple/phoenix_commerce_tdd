use Mix.Config

# For production, we configure the host to read the PORT
# from the system environment. Therefore, you will need
# to set PORT=80 before running your server.
#
# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
#
# Finally, we also include the path to a manifest
# containing the digested version of static files. This
# manifest is generated by the mix phoenix.digest task
# which you typically run after static files are built.
config :phoenix_commerce, PhoenixCommerce.Endpoint,
  #http: [port: {:system, "PORT"}],
  http: [port: 8080],
  url: [host: (String.strip :binary.list_to_bin :os.cmd :binary.bin_to_list("/bin/hostname")) ],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: "9efJbrjQ97Z1o4rqOsZdp+rR1OsgW5TuVRdRsZ5Q9RW/ZsVFqHAtK+F5fPDu2GUV", 
  server: true

# Do not print debug messages in production
config :logger, level: :info

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :phoenix_commerce, PhoenixCommerce.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :phoenix_commerce, PhoenixCommerce.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :phoenix_commerce, PhoenixCommerce.Endpoint, server: true
#

# Configure your database
config :phoenix_commerce, PhoenixCommerce.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: (System.get_env("postgres_prod_username") || raise "can't load config postgres_test_username"),
  password: (System.get_env("postgres_prod_password") || raise "can't load config postgres_test_password"),
  database: (System.get_env("postgres_prod_database") || raise "can't load config postgres_test_database"),
  hostname: (System.get_env("postgres_prod_hostname") || raise "can't load config postgres_test_hostname"),
  port:     (System.get_env("postgres_prod_port")     || raise "can't load config postgres_test_port"),
  pool_size: 20


