defmodule EmailSender.EmailTest do
  use ExUnit.Case
  use Bamboo.Test

  test "create" do
    email = EmailSender.Email.create("user@test.com",
                                     "test subject",
                                     "<h1>Hello!</h1>")
    assert email.to == "user@test.com"
    assert email.subject == "test subject"
    assert email.html_body =~ "Hello!"
  end
end
