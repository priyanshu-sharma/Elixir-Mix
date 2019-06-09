defmodule KEYVALUETest do
  use ExUnit.Case
  doctest KEYVALUE

  test "greets the world" do
    assert KEYVALUE.hello() == :world
  end
end
