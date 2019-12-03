defmodule AdventOfCode.Day03Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day03

  @input [:code.priv_dir(:advent_of_code), "inputs", "day03.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split("\n", trim: true)

  describe "part one" do
    test "examples" do
      assert Day03.part_one("R8,U5,L5,D3", "U7,R6,D4,L4") == 6
      assert Day03.part_one("R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83") == 159
      assert Day03.part_one("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7") == 135
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 03a"
      IO.inspect Day03.part_one(hd(@input), hd(tl(@input)))
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "examples" do
      assert Day03.part_two("R8,U5,L5,D3", "U7,R6,D4,L4") == 30
      assert Day03.part_two("R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83") == 610
      assert Day03.part_two("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7") == 410
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 03b"
      IO.inspect Day03.part_two(hd(@input), hd(tl(@input)))
      IO.puts "--------------------"
    end
  end
end
