defmodule EmailSender.Email do
  import Bamboo.Email

  def create(to, subject, body) do
    new_email()
    |> to(to)
    |> from("obafemi.o@ng.lopworks.com")
    |> subject(subject)
    |> html_body(body)
    |> text_body(body)
  end

end
