defmodule AdventOfCode.Day07Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day07

  @input [:code.priv_dir(:advent_of_code), "inputs", "Day07.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

  describe "part one" do
    # test "examples" do
    #   assert Day07.run_amplifiers([3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0], [4,3,2,1,0]) == 43210
    #   assert Day07.part_one([3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0]) == 43210
    # end

    # test "problem" do
    #   IO.puts "--------------------"
    #   IO.puts "Answer to Puzzle 07a"
    #   IO.inspect Day07.part_one(@input)
    #   IO.puts "--------------------"
    # end
  end

  describe "part two" do
    test "examples" do
      assert Day07.feedback_amplifiers([3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5], [9,8,7,6,5]) == 139629729
      assert Day07.part_two([3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5]) == 139629729
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 07b"
      IO.inspect Day07.part_two(@input)
      IO.puts "--------------------"
    end
  end
end
