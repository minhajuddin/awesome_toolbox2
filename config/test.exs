use Mix.Config

# Configure your database
config :awesome_toolbox, AwesomeToolbox.Repo,
  username: "postgres",
  password: "postgres",
  database: "awesome_toolbox_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :awesome_toolbox, AwesomeToolboxWeb.Endpoint,
  http: [port: 4002],
  server: false

config :awesome_toolbox,
  github_api: AwesomeToolboxTest.FakeGithub

# Print only warnings and errors during test
config :logger, level: :warn
