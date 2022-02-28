defmodule R2ElixirBench.MaskingAlgorithm do
  @moduledoc false

  def call(input, regular_expressions) do
    Enum.reduce(regular_expressions, input, fn regex, current_string ->
      apply_single_regex(current_string, regex)
    end)
  end

  defp apply_single_regex(input, regex) do
    case :re2.match(input, regex) do
      {:match, [first_match | _rest]} ->
        length = String.length(first_match)
        replacement = String.duplicate("*", length)

        new_input = String.replace(input, first_match, replacement)
        apply_single_regex(new_input, regex)

      :nomatch ->
        input
    end
  end
end
