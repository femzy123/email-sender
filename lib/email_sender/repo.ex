defmodule EmailSender.Repo do
  use Ecto.Repo,
    otp_app: :email_sender,
    adapter: Ecto.Adapters.Postgres
end
