defmodule ElixirWorkshop2017.Redit.ApiGenServer do
  use GenServer
  alias ElixirWorkshop2017.Utils.Http.Request

  ## API
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, [name: :api_gen_server])
  end

  def init(_) do
    {:ok, nil}
  end

  def get_available_subreddits(query) do
    GenServer.call(:api_gen_server, {:fetch_available_subreddits, query})
  end

  def get_reddit_posts(subreddit) do
    GenServer.call(:api_gen_server, {:fetch_reddit, subreddit})
  end

  ## Callbacks

  def handle_call({:fetch_available_subreddits, query}, _from, state) do
    computed_url = "https://www.reddit.com/api/subreddits_by_topic.json?query=#{query}"
    
    with {:ok, %HTTPoison.Response{status_code: 200, body: body}} <- Request.get(computed_url),
      {:ok, decoded_json} <- Poison.decode(body),
      data <- Enum.map(decoded_json, &(&1["name"]))
    do
      {:reply, data, data}
    else
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
    end
  end

  def handle_call({:fetch_reddit, subreddit}, _from, state) do
    computed_url = "https://www.reddit.com/r/#{subreddit}.json"

    with {:ok, %HTTPoison.Response{status_code: 200, body: body}} <- Request.get(computed_url),
      {:ok, decoded_json} <- Poison.decode(body),
      data <- Enum.map(decoded_json["data"]["children"], &(%{
        title: &1["data"]["title"],
        created: &1["data"]["created"],
        author: &1["data"]["author"],
        link: &1["data"]["permalink"]
      }))
    do
      {:reply, data, data}
    else
      {:error, reason} -> {:reply, :error, reason}
    end
  end
end

# https://www.reddit.com/r/#{subreddit}.json
# search for subredit https://www.reddit.com/api/subreddits_by_topic.json?query=9gag
