defmodule ElixirWorkshop2017Web.PageController do
  use ElixirWorkshop2017Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def search(conn, params) do
    render conn, "index.html"
  end
end
