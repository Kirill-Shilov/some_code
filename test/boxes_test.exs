defmodule BoxesTest do
  use ExUnit.Case
  doctest Boxes

  test "box test" do
    {:ok, box} = GenServer.start_link(Box, [])
    GenServer.call(box, {:push, 1})
    {:ok, res} = GenServer.call(box, {:show})
    assert res == [1]
  end
end
