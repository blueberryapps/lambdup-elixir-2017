defmodule ElixirWorkshop2017Web.SearchController do
  use ElixirWorkshop2017Web, :controller

  alias ElixirWorkshop2017.Redit
  alias ElixirWorkshop2017.Redit.Search
  alias ElixirWorkshop2017.Redit.ApiGenServer

  def index(conn, _params) do
    searches = Redit.list_searches()
    render(conn, "index.html", searches: searches)
  end

  def new(conn, %{"search" => %{"query" => query}}) do
    topics = ApiGenServer.get_available_subreddits(query)
    render(conn, "new.html", topics: topics)
  end

  def create(conn, params) do
    selected_topics = Enum.filter(params, &(elem(&1,1) == "true")) |> Enum.map(&(elem(&1, 0)))
    grouped_posts = selected_topics |> Enum.map(fn(topic) -> {topic, ApiGenServer.get_reddit_posts(topic)} end) 
    
    conn
    |> render("show.html", grouped_posts: grouped_posts)

    # TODO: save it to DB
    # conn
    # |> put_flash(:info, "Search created successfully.")
    # |> redirect(to: search_path(conn, :show, 1, posts))
  end
end
