defmodule AdventOfCode.Day01Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day01

  @input [:code.priv_dir(:advent_of_code), "inputs", "day01.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split("\n", trim: true)
         |> Enum.map(&String.to_integer/1)

  describe "part one" do
    test "examples" do
      assert Day01.fuel(12) == 2
      assert Day01.fuel(14) == 2
      assert Day01.fuel(1969) == 654
      assert Day01.fuel(100756) == 33583
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 01a"
      IO.inspect Day01.part_one(@input)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "examples" do
      assert Day01.fuel_with_fuel_from_fuel(12) == 2
      assert Day01.fuel_with_fuel_from_fuel(1969) == 966
      assert Day01.fuel_with_fuel_from_fuel(100756) == 50346
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 01b"
      IO.inspect Day01.part_two(@input)
      IO.puts "--------------------"
    end
  end
end
