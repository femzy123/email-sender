defmodule EmailSender.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :to, :string
      add :subject, :string
      add :body, :string

      timestamps()
    end

  end
end
