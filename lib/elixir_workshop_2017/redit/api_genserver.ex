defmodule ElixirWorkshop2017.Redit.ApiGenServer do
  use GenServer

  ## API
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, [])
  end

  def init(_) do
    {:ok, nil}
  end

  def get_subreddits(query) do
    GenServer.call(__MODULE__, {:fetch, query})
  end

  ## Callbacks

  def handle_call({:fetch, query}, _from, state) do
    IO.inspect "called with #{query}"
  end
end

# https://www.reddit.com/r/#{subreddit}.json
# search for subredit https://www.reddit.com/api/subreddits_by_topic.json?query=9gag
