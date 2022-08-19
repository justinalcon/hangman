import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :b2, B2Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lzLNGGCnRB2nFA47A72iCKJOjG2Wyki1nCOQ0D5owy61wiXSr6pYNkIZDwq3PiWL",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
