defmodule AdventOfCode.Day04 do
  def part_one(from, to) do
    Enum.count(from..to, fn num -> is_valid_part_one(Integer.to_string(num)) end)
  end

  def is_valid_part_one(code) do
    digits = String.graphemes(code)
    |> Enum.map(fn c -> String.to_integer(c) end)

    digits == Enum.sort(digits) && String.match?(code, ~r/(\d)\1{1}/)
  end 

  def part_two(from, to) do
    Enum.count(from..to, fn num -> is_valid_part_two(Integer.to_string(num)) end)
  end

  def is_valid_part_two(code) do
    digits = String.graphemes(code)
    |> Enum.map(fn c -> String.to_integer(c) end)

    digits == Enum.sort(digits) && has_two_consecutive_digits(digits)
  end

  def has_two_consecutive_digits(digits) do
    Enum.chunk_by(digits, fn x -> x end)
    |> Enum.map(fn a -> length(a) end)
    |> Enum.any?(fn c -> c == 2 end)
  end
end
