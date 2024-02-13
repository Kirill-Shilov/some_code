defmodule Source do
  use GenServer

  @impl true
  def init({values, even, odd}) do
    {:ok, {values, even, odd}}
  end

  @impl true
  def handle_call(:purge, _, _) do
    {:reply, :ok, []}
  end

  @impl true
  def handle_call({:new, value}, _, state) do
    {:reply, :ok, {value, elem(state, 1), elem(state, 2)}}
  end

  @impl true
  def handle_call(:split, _, state) do
    values = elem(state, 0)
    even = elem(state, 1)
    odd = elem(state, 2)
    calculate(values, even, odd)
  end

  defp calculate(list, even, odd) do
    case list do
      [h | t] ->
        if rem(h, 2) == 0 do
          :ok = GenServer.call(even, {:push, h})
        else
          :ok = GenServer.call(odd, {:push, h})
        end
        {:reply, :ok, [t, even, odd]}
        calculate(t, even, odd)
      [] -> {:reply, :ok, {[], even, odd}}
    end
  end
end
