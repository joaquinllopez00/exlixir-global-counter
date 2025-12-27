defmodule Counter do
  use Application

  @moduledoc """
  Documentation for `Counter`.
  """

  @impl true
  def start(_type, _args) do
    children = [
      {Counter.Server, 0},
      {Plug.Cowboy, scheme: :http, plug: Counter.Router, options: [port: 4000]}
    ]

    opts = [strategy: :one_for_one, name: Counter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
