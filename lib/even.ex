defmodule Even do
  use GenServer

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
    IO.inspect(state)
    {:reply, :ok, state}
  end

  @impl true
  def handle_call(:purge, _, _) do
    {:reply, :ok, []}
  end
end
