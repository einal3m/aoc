defmodule AdventOfCode.Day11Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day11

  @input [:code.priv_dir(:advent_of_code), "inputs", "Day11.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

  describe "part one" do
    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 11a"
      IO.inspect Day11.part_one(@input)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 11b"
      IO.puts ""
      IO.puts Day11.part_two(@input)
      IO.puts ""
      IO.puts "--------------------"
    end
  end
end
