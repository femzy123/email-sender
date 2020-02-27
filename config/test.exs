use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :email_sender, EmailSenderWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :email_sender, EmailSender.Repo,
  username: "postgres",
  password: "postgres",
  database: "email_sender_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox


config :email_sender, EmailSender.Mailer,
  adapter: Bamboo.TestAdapter
