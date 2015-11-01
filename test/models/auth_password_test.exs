defmodule Heimdall.AuthPasswordTest do
  use Heimdall.ModelCase

  alias Heimdall.AuthPassword

  @valid_attrs %{raw_password: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AuthPassword.changeset(%AuthPassword{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AuthPassword.changeset(%AuthPassword{}, @invalid_attrs)
    refute changeset.valid?
  end
end
