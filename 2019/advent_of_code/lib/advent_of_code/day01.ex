defmodule AdventOfCode.Day01 do
  def part_one(input) do
    Enum.reduce(
      input,
      0, 
      fn(mass, acc) -> fuel(mass) + acc end
    )
  end

  def part_two(input) do
    Enum.reduce(
      input,
      0, 
      fn(mass, acc) -> fuel_with_fuel_from_fuel(mass) + acc end
    )
  end

  def fuel_with_fuel_from_fuel(mass) do
    case fuel(mass) do
      f when f > 0 -> 
        f + fuel_with_fuel_from_fuel(f)
      _ ->
        0
    end
  end

  def fuel(mass) do
    Integer.floor_div(mass, 3) - 2
  end
end
