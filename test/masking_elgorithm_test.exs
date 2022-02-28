defmodule R2ElixirBench.MaskingAlgorithmTest do
  use ExUnit.Case

  test "masks input using single regex" do
    input = "foo bar baz"
    regexes = ["bar"]

    assert R2ElixirBench.MaskingAlgorithm.call(input, regexes) == "foo *** baz"
  end

  test "masks input using multiple regular expressions" do
    regexes = ["(abc|defgh)", "([(0-9)]{6})"]

    input =
      "Hello my secrets are \"abc\" and defgh my number is 654321 and secrets again are abc and \"defgh\""

    assert R2ElixirBench.MaskingAlgorithm.call(input, regexes) ==
             "Hello my secrets are \"***\" and ***** my number is ****** and secrets again are *** and \"*****\""
  end
end
