defmodule R2ElixirBench.Benchmark do
  def call() do
    regexes = [
      "(?:00[1-9]|0[1-9][0-9]|[1-578][0-9]{2}|6[0-57-9][0-9]|66[0-57-9])-(?:0[1-9]|[1-9]0|[1-9][1-9])-(?:[1-9][0-9][0-9][0-9]|[0-9][1-9][0-9][0-9]|[0-9][0-9][1-9][0-9]|[0-9][0-9][0-9][1-9])"
    ]

    compiled_regexes = Enum.map(regexes, fn regex -> :re2.compile(regex) |> elem(1) end)

    Benchee.run(
      %{
        "masking_algorithm" => fn {input, regexes} ->
          R2ElixirBench.MaskingAlgorithm.call(input, regexes)
        end
      },
      inputs: %{
        "Valid SSNs" => {R2ElixirBench.BenchmarkHelper.generate_input_with_valid_ssns(), regexes},
        "Valid SSNs with compiled regexes" =>
          {R2ElixirBench.BenchmarkHelper.generate_input_with_valid_ssns(), compiled_regexes}
      }
    )
  end
end
