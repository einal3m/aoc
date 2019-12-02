defmodule AdventOfCode.Day02 do
  def part_one(input, noun, verb) do
    input
    |> List.replace_at(1, noun)
    |> List.replace_at(2, verb)
    |> int_code(0)
    |> Enum.at(0)
  end

  def part_two(input, output) do
    is_output? = fn(n, v) -> part_one(input, n, v) == output end

    result = 
      for noun <- 0..99, 
          verb <- 0..99, 
          is_output?.(noun, verb) do
        {noun, verb}
      end

    Enum.at(result, 0)
  end

  def int_code(input, index) do
    case Enum.at(input, index) do
      1 -> 
        List.replace_at(input, Enum.at(input, index + 3), Enum.at(input, Enum.at(input, index + 1)) + Enum.at(input, Enum.at(input, index + 2)))
        |> int_code(index + 4)
      2 -> 
        List.replace_at(input, Enum.at(input, index + 3), Enum.at(input, Enum.at(input, index + 1)) * Enum.at(input, Enum.at(input, index + 2)))
        |> int_code(index + 4)
      99 ->
        input
    end
  end
end
