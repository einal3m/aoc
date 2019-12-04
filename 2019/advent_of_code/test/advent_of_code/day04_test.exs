defmodule AdventOfCode.Day04Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day04

  describe "part one" do
    test "examples" do
      assert Day04.is_valid_part_one("111123") == true
      assert Day04.is_valid_part_one("223450") == false
      assert Day04.is_valid_part_one("123789") == false
      assert Day04.is_valid_part_one("122345") == true
      assert Day04.is_valid_part_one("111123") == true
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 04a"
      IO.inspect Day04.part_one(146810, 612564)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "examples" do
      assert Day04.is_valid_part_two("112233") == true
      assert Day04.is_valid_part_two("123444") == false
      assert Day04.is_valid_part_two("111122") == true
      assert Day04.is_valid_part_two("111466") == true
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 04b"
      IO.inspect Day04.part_two(146810, 612564)
      IO.puts "--------------------"
    end
  end
end
