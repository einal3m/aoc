defmodule AdventOfCode.Day05Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day05

  @input [:code.priv_dir(:advent_of_code), "inputs", "Day05.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

  describe "part one" do
    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 05a"
      IO.inspect Enum.reverse(Day05.int_code(@input, 0, 1, []))
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "examples" do
      assert Day05.int_code([3,9,8,9,10,9,4,9,99,-1,8], 0, 8, []) == [1]
      assert Day05.int_code([3,9,8,9,10,9,4,9,99,-1,8], 0, 0, []) == [0]
      assert Day05.int_code([3,9,7,9,10,9,4,9,99,-1,8], 0, 7, []) == [1]
      assert Day05.int_code([3,9,7,9,10,9,4,9,99,-1,8], 0, 9, []) == [0]

      assert Day05.int_code([3,3,1108,-1,8,3,4,3,99], 0, 8, []) == [1]
      assert Day05.int_code([3,3,1108,-1,8,3,4,3,99], 0, 0, []) == [0]
      assert Day05.int_code([3,3,1107,-1,8,3,4,3,99], 0, 7, []) == [1]
      assert Day05.int_code([3,3,1107,-1,8,3,4,3,99], 0, 9, []) == [0]

      assert Day05.int_code([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 0, 0, []) == [0]
      assert Day05.int_code([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 0, 1, []) == [1]
      assert Day05.int_code([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 0, 0, []) == [0]
      assert Day05.int_code([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 0, 1, []) == [1]

      assert Day05.int_code([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, 7, []) == [999]
      assert Day05.int_code([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, 8, []) == [1000]
      assert Day05.int_code([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 0, 9, []) == [1001]
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 05b"
      IO.inspect Day05.int_code(@input, 0, 5, [])
      IO.puts "--------------------"
    end
  end
end