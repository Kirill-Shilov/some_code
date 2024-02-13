defmodule BoxesTest do
  use ExUnit.Case
  doctest Boxes

  test "greets the world" do
    assert Boxes.hello() == :world
  end
end
