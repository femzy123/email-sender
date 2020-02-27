defmodule EmailSenderWeb.MessageController do
  use EmailSenderWeb, :controller

  alias EmailSender.Mailing
  alias EmailSender.Mailing.Message

  def index(conn, _params) do
    messages = Mailing.list_messages()
    render(conn, "index.html", messages: messages)
  end

  def new(conn, _params) do
    changeset = Mailing.change_message(%Message{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"message" => message_params}) do
    case Mailing.create_message(message_params) do
      {:ok, message} ->
        email = EmailSender.Email.create(message.to, message.subject, message.body<>" <strong>From: </strong>"<>message.subject)
        EmailSender.Mailer.deliver_now(email)

        conn
        |> put_flash(:info, "Message created successfully. An email has been sent to you containing your ticket details")
        |> redirect(to: Routes.message_path(conn, :show, message))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    message = Mailing.get_message!(id)
    render(conn, "show.html", message: message)
  end

  def edit(conn, %{"id" => id}) do
    message = Mailing.get_message!(id)
    changeset = Mailing.change_message(message)
    render(conn, "edit.html", message: message, changeset: changeset)
  end

  def update(conn, %{"id" => id, "message" => message_params}) do
    message = Mailing.get_message!(id)

    case Mailing.update_message(message, message_params) do
      {:ok, message} ->
        conn
        |> put_flash(:info, "Message updated successfully.")
        |> redirect(to: Routes.message_path(conn, :show, message))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", message: message, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = Mailing.get_message!(id)
    {:ok, _message} = Mailing.delete_message(message)

    conn
    |> put_flash(:info, "Message deleted successfully.")
    |> redirect(to: Routes.message_path(conn, :index))
  end
end
