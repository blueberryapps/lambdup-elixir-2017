defmodule ElixirWorkshop2017.Utils.Http.Request do
  @request_timeout_sec 30_000

  def get(url) do
    HTTPoison.get(
      url,
      [],
      [
        recv_timeout: @request_timeout_sec,
        timeout: @request_timeout_sec
      ]
    )
  end
end
