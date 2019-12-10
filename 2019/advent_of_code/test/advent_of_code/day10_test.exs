defmodule AdventOfCode.Day10Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day10

  @input [:code.priv_dir(:advent_of_code), "inputs", "Day10.txt"]
         |> Path.join()
         |> File.read!()

  describe "part one" do
    test "examples" do
      assert Day10.part_one(".#..#\n.....\n#####\n....#\n...##\n") == {{3,4}, 8}
      assert Day10.part_one("......#.#.\n#..#.#....\n..#######.\n.#.#.###..\n.#..#.....\n..#....#.#\n#..#....#.\n.##.#..###\n##...#..#.\n.#....####") == {{5,8}, 33}
      assert Day10.part_one("#.#...#.#.\n.###....#.\n.#....#...\n##.#.#.#.#\n....#.#.#.\n.##..###.#\n..#...##..\n..##....##\n......#...\n.####.###.") == {{1,2}, 35}
      assert Day10.part_one(".#....#####...#..\n##...##.#####..##\n##...#...#.#####.\n..#.....#...###..\n..#.#.....#....##\n") == {{8, 3}, 30}
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 08a"
      IO.inspect Day10.part_one(@input)
      IO.puts "--------------------"
    end
  end

  describe "part two" do
    test "examples" do
      assert Day10.part_two(".#..##.###...#######\n##.############..##.\n.#.######.########.#\n.###.#######.####.#.\n#####.##.#.##.###.##\n..#####..#.#########\n####################\n#.####....###.#.#.##\n##.#################\n#####.##.###..####..\n..######..##.#######\n####.##.####...##..#\n.#####..#.######.###\n##...#.##########...\n#.##########.#######\n.####.#.###.###.#.##\n....##.##.###..#####\n.#.#.###########.###\n#.#.#.#####.####.###\n###.##.####.##.#..##\n", {11,13}) == {8, 2}
    end

    test "problem" do
      IO.puts "--------------------"
      IO.puts "Answer to Puzzle 08b"
      IO.inspect Day10.part_two(@input, {11, 11})
      IO.puts "--------------------"
    end
  end
end
