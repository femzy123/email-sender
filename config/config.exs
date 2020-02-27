# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :email_sender,
  ecto_repos: [EmailSender.Repo]

# Configures the endpoint
config :email_sender, EmailSenderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zBz1HsqGJMzuJNA3Mppdspq2OhNi1fIXiK58fQmkWo39j2o+YWWFLt+j6ivL+YVs",
  render_errors: [view: EmailSenderWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EmailSender.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
import_config "smtp.exs"

config :email_sender, EmailSender.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 465, #587
  # username: System.get_env("SMTP_USERNAME"),
  # password: System.get_env("PASSWORD"),
  tls: :if_available,
  allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"],
  ssl: true,
  retries: 1,
  no_mx_lookups: false
  # auth: :if_available
