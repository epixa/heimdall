defmodule Heimdall.AppsController do
  use Heimdall.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
