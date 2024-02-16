defmodule Boxes do
  @moduledoc """
  Documentation for `Boxes`.
  """

  @doc """
  ## Examples
      iex> Boxes.split(1..10 |> Enum.to_list)
      [10, 8, 6, 4, 2]
      [9, 7, 5, 3, 1]
  """
  def split(values) do
    {:ok, even} = GenServer.start_link(Box, [])
    {:ok, odd} = GenServer.start_link(Box, [])
    {:ok, source} = GenServer.start_link(Source, {values, even, odd})
    GenServer.call(source, :split)
    GenServer.call(even, :show)
    GenServer.call(odd, :show)
  end

  @doc """
  ## Examples
      Boxes.split2(1..20 |> Enum.to_list)
      [20, 18, 16, 14, 12, 10, 8, 6, 4, 2]
      [19, 17, 15, 13, 11, 9, 7, 5, 3, 1, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1]
  """
  def split2(values) do
    {:ok, even} = GenServer.start_link(Box, [])
    {:ok, odd} = GenServer.start_link(Box, [])
    {:ok, source} = GenServer.start_link(Source, {values, even, odd})
    GenServer.call(source, :split)
    GenServer.call(even, :purge)
    GenServer.call(source, {:new, values})
    GenServer.call(source, :split)
    GenServer.call(even, :show)
    GenServer.call(odd, :show)
  end
end
