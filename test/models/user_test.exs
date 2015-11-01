defmodule Heimdall.UserTest do
  use Heimdall.ModelCase

  alias Heimdall.User

  @valid_attrs %{
    email: "some content",
    password: %{ raw_password: "definitely a valid password" }
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
