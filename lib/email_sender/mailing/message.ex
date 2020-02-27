defmodule EmailSender.Mailing.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    field :subject, :string
    field :to, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:to, :subject, :body])
    |> validate_required([:to, :subject, :body])
  end
end
