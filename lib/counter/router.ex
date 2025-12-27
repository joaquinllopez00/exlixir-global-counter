defmodule Counter.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    with {:ok, file} <- File.read("fe/index.html") do
      send_resp(conn, 200, file)
    else
      {:error, _} -> send_resp(conn, 500, "Internal Server Error")
    end
  end

  get "/api/count" do
    count = Counter.Server.get_count()
    json = Jason.encode!(%{count: count})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, json)
  end

  post "/api/increment" do
    new_count = Counter.Server.increment()
    json = Jason.encode!(%{count: new_count})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, json)
  end

  post "/api/decrement" do
    new_count = Counter.Server.decrement()
    json = Jason.encode!(%{count: new_count})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, json)
  end

  post "/api/reset" do
    new_count = Counter.Server.reset()
    json = Jason.encode!(%{count: new_count})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, json)
  end

  match(_, do: send_resp(conn, 404, "Not Found"))
end
