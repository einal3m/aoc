defmodule AdventOfCode.Day06Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day06

  @input [:code.priv_dir(:advent_of_code), "inputs", "Day06.txt"]
         |> Path.join()
         |> File.read!()
         |> String.split("\n", trim: true)

  describe "part one" do
    test "examples" do
      assert Day06.part_one(["COM)B","B)C"]) == 3
      assert Day06.part_one(["COM)B","B)C","C)D"]) == 6
      assert Day06.part_one(["COM)B","B)C","C)D","B)G"]) == 8
      assert Day06.part_one(["COM)B","B)C","C)D","D)E","E)F","B)G","G)H","D)I","E)J","J)K","K)L"]) == 42
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 06a"
      IO.inspect Day06.part_one(@input)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "examples" do
      assert Day06.part_two(["COM)B","B)C","C)D","D)E","E)F","B)G","G)H","D)I","E)J","J)K","K)L","K)YOU", "I)SAN"]) == 4
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 06b"
      IO.inspect Day06.part_two(@input)
      IO.puts "--------------------"
    end
  end
end
