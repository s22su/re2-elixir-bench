defmodule R2ElixirBench.BenchmarkHelper do
  @max_chat_message_length 10000

  def generate_input_with_valid_ssns(current_input \\ "") do
    if String.length(current_input) < @max_chat_message_length do
      ssn = Enum.random(valid_ssns())

      new_input = "#{current_input} #{ssn}"

      generate_input_with_valid_ssns(new_input)
    else
      String.trim(current_input)
    end
  end

  defp valid_ssns() do
    [
      "111-12-1234",
      "817-12-1255",
      "100-82-8765",
      "010-82-8765",
      "001-82-8765",
      "123-09-1234",
      "123-90-1234",
      "123-25-1234",
      "123-11-1234",
      "111-11-1234",
      "111-99-1234",
      "001-01-0001",
      "001-01-0010",
      "001-01-0100",
      "001-01-1000",
      "001-01-1231"
    ]
  end
end
