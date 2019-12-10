defmodule AdventOfCode.Day09Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day09

  @input [:code.priv_dir(:advent_of_code), "inputs", "Day09.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

  describe "part one" do
    test "examples" do
      input = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]

      assert Day09.part_one(input) == input

      assert Day09.part_one([1102,34915192,34915192,7,4,7,99,0]) == [1219070632396864]
      assert Day09.part_one([104,1125899906842624,99]) == [1125899906842624]
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 09a"
      IO.inspect Day09.part_one(@input, 1)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 09b"
      IO.inspect Day09.part_one(@input, 2)
      IO.puts "--------------------"
    end
  end
end
