defmodule ElixirWorkshop2017Web.SearchController do
  use ElixirWorkshop2017Web, :controller

  alias ElixirWorkshop2017.Redit
  alias ElixirWorkshop2017.Redit.Search

  def index(conn, _params) do
    searches = Redit.list_searches()
    render(conn, "index.html", searches: searches)
  end

  def new(conn, _params) do
    changeset = Redit.change_search(%Search{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"search" => search_params}) do
    case Redit.create_search(search_params) do
      {:ok, search} ->
        conn
        |> put_flash(:info, "Search created successfully.")
        |> redirect(to: search_path(conn, :show, search))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
