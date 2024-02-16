defmodule BoxesTest do
  use ExUnit.Case

  test "box test" do
    {:ok, box} = Box.start_link([])
    Box.push(box, 1)
    res = Box.show(box)
    assert res == [1]
  end
end
