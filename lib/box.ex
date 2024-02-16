defmodule Box do
  use GenServer
  require ForTests

  @impl true
  def init([]) do
    {:ok, []}
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
    {:reply, :ok, state}
  end

  @impl true
  def handle_call(:purge, _, _) do
    {:reply, :ok, []}
  end
end
