defmodule Boxes do
  @moduledoc """
  Documentation for `Boxes`.
  """

  @doc ~S"""
  ## Examples
      iex> Boxes.split(1..10 |> Enum.to_list)
      ...>[10, 8, 6, 4, 2]
      ...>[9, 7, 5, 3, 1]
  """
  def split(values) do
    {:ok, even} = Box.start_link([])
    {:ok, odd} = Box.start_link([])
    {:ok, source} = Source.start_link({[], even, odd})
    Source.new(source, values)
    Source.split(source)
    Box.show(even)
    Box.show(odd)
  end

  @doc ~S"""
  ## Examples
      iex> Boxes.split2(1..20 |> Enum.to_list)
      ...>[20, 18, 16, 14, 12, 10, 8, 6, 4, 2]
      ...>[19, 17, 15, 13, 11, 9, 7, 5, 3, 1, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1]
  """
  def split2(values) do
    {:ok, even} = Box.start_link([])
    {:ok, odd} = Box.start_link([])
    {:ok, source} = Source.start_link({[], even, odd})
    Source.new(source, values)
    Source.split(source)
    Box.purge(even)
    Source.new(source, values)
    Source.split(source)
    Box.show(even)
    Box.show(odd)
  end
end
