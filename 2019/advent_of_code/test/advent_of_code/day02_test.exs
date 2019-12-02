defmodule AdventOfCode.Day02Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day02

  @input [:code.priv_dir(:advent_of_code), "inputs", "day02.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

  describe "part one" do
    test "examples" do
      assert Day02.int_code([1,0,0,0,99],0) == [2,0,0,0,99]
      assert Day02.int_code([2,3,0,3,99],0) == [2,3,0,6,99]
      assert Day02.int_code([1,9,10,3,2,3,11,0,99,30,40,50],0) == [3500,9,10,70,2,3,11,0,99,30,40,50]
      assert Day02.int_code([2,4,4,5,99,0],0) == [2,4,4,5,99,9801]
      assert Day02.int_code([1,1,1,4,99,5,6,0,99],0) == [30,1,1,4,2,5,6,0,99]
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 02a"
      IO.inspect Day02.part_one(@input, 12, 2)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "problem" do
      {noun, verb} = Day02.part_two(@input, 19690720)

      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 02b"
      IO.puts Integer.to_string(100 * noun + verb)
      IO.puts "--------------------"
    end
  end
end
