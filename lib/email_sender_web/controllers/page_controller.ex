defmodule EmailSenderWeb.PageController do
  use EmailSenderWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
