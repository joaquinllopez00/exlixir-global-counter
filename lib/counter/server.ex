require Logger

defmodule Counter.Server do
  use GenServer

  def start_link(initial_value \\ 0) do
    ## USING THE MODULE MACRO TO NAME
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
    ## OTHERWISE WE WOULD HAVE TO PASS PID (name) TO UPDATE THE CORRECT GEN SERVER BELOW,
    ## BUT SINCE WE CREATE ONE INSTANCE OF THIS IN OUR COUNTER.EX APPLICATION, WE REFERENCE MODULE, THERE IS ONE GLOBAL COUNT
  end

  def increment() do
    GenServer.call(__MODULE__, :inc)
  end

  def decrement() do
    GenServer.call(__MODULE__, :dec)
  end

  def get_count() do
    GenServer.call(__MODULE__, :get_count)
  end

  def reset() do
    GenServer.call(__MODULE__, :reset)
  end

  ### gen server callbacks

  @impl true
  def init(initial_value) do
    Logger.info("Initializing counter with value: #{initial_value}")
    val = trunc(initial_value)
    {:ok, val}
  end

  ### handling our calls
  @impl true
  def handle_call(:inc, _from, state) do
    new_state = state + 1
    Logger.info("Incrementing counter to: #{new_state}")
    {:reply, new_state, new_state}
  end

  @impl true
  def handle_call(:dec, _from, state) do
    new_state = state - 1
    Logger.info("Decrementing counter to: #{new_state}")
    {:reply, new_state, new_state}
  end

  @impl true
  def handle_call(:get_count, _from, state) do
    Logger.info("Getting count: #{state}")
    {:reply, state, state}
  end

  @impl true
  def handle_call(:reset, _from, _state) do
    Logger.info("Resetting counter to 0")
    {:reply, 0, 0}
  end
end
