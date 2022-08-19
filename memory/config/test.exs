import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :memory, MemoryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "IBuDOXypMBYqMKjC7vFjkpw47EO68JP9O9Z1t1dS4q4t+a9lZKtCEStNmt7tXnct",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
