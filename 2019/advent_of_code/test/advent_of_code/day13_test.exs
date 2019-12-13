defmodule AdventOfCode.Day13Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day13

  @input [:code.priv_dir(:advent_of_code), "inputs", "Day13.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

  describe "part one" do
    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 13a"
      IO.inspect Day13.part_one(@input)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    @tag timeout: :infinity
    test "problem" do
      IO.puts "--------------------"
      IO.puts "Puzzle 13b:"
      IO.puts "--------------------"

      Day13.part_two(@input)
    end
  end
end
