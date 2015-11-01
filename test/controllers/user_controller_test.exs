defmodule Heimdall.UserControllerTest do
  use Heimdall.ConnCase

  alias Heimdall.User
  @valid_attrs %{
    email: "some content",
    password: %{ raw_password: "definitely a valid password" }
  }
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user_path(conn, :new)
    assert html_response(conn, 200) =~ "Sign up"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    assert redirected_to(conn) == apps_path(conn, :index)
    assert Repo.get_by(User, %{ email: @valid_attrs.email })
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @invalid_attrs
    assert html_response(conn, 200) =~ "Sign up"
  end
end
