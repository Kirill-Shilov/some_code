defmodule Box do
  use GenServer
  require ForTests

  def start_link(value) do
    GenServer.start(__MODULE__, value)
  end

  def push(pid, value) do
    GenServer.call(pid, {:push, value})
  end

  def show(pid) do
    GenServer.call(pid, :show)
  end

  def purge(pid) do
    GenServer.call(pid, :purge)
  end

  @impl true
  def init(val \\ []) do
    {:ok, val}
  end

  @impl true
  def handle_call({:push, value}, _, state) do
    {:reply, :ok, [value | state]}
  end

  @impl true
  def handle_call(:show, _, state) do
    ForTests.only_test do
      IO.inspect(state)
    end
    {:reply, state, state}
  end

  @impl true
  def handle_call(:purge, _, _) do
    {:reply, :ok, []}
  end
end
