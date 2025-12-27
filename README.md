# Counter

Ensure elixir is installed

1. `mix deps.get`
2. `iex -S mix`
3. Navigate to localhost:4000 
4. You'll see a count, you can interact with `Counter.Server.get_count()` to see how the value is actually being updating on the GenServer running in memory!


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `counter` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:counter, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/counter>.

