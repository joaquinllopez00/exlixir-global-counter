defmodule CounterServerTest do
  use ExUnit.Case, async: false
  doctest Counter.Server

  setup do
    Counter.Server.reset()
    :ok
  end

  test "starts at zero" do
    assert Counter.Server.get_count() == 0
  end

  test "increment increases count by 1" do
    assert Counter.Server.increment() == 1
    assert Counter.Server.increment() == 2
    assert Counter.Server.get_count() == 2
  end

  test "decrement decreases count by 1" do
    Counter.Server.increment()
    assert Counter.Server.decrement() == 0
    assert Counter.Server.decrement() == -1
  end

  test "reset returns counter to zero" do
    Counter.Server.increment()
    Counter.Server.increment()
    assert Counter.Server.get_count() == 2

    assert Counter.Server.reset() == 0
    assert Counter.Server.get_count() == 0
  end

  test "multiple operations work correctly" do
    Counter.Server.increment()
    Counter.Server.increment()
    Counter.Server.decrement()
    Counter.Server.increment()

    assert Counter.Server.get_count() == 2
  end
end
