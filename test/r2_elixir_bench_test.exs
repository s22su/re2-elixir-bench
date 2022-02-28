defmodule R2ElixirBenchTest do
  use ExUnit.Case
  doctest R2ElixirBench

  test "greets the world" do
    assert R2ElixirBench.hello() == :world
  end
end
