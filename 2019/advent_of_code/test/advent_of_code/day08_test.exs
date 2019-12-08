defmodule AdventOfCode.Day08Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day08

  @input [:code.priv_dir(:advent_of_code), "inputs", "Day08.txt"]
         |> Path.join()
         |> File.read!()

  describe "part one" do
    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 08a"
      IO.inspect Day08.part_one(@input, 25, 6)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "examples" do
      assert Day08.create_image("0222112222120000", 2, 2) == %{{0,0} => "0", {0,1} => "1", {1,0} => "1", {1,1} => "0"}
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 08b"
      IO.puts ""
      IO.puts Day08.part_two(@input, 25, 6)
      IO.puts ""
      IO.puts "--------------------"
    end
  end
end
