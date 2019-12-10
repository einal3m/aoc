defmodule AdventOfCode.Day09 do
  def part_one(codes, input \\ 0) do
    AdventOfCode.IntCode.initialize_instructions(codes)
    |> AdventOfCode.IntCode.run_until_done([input])
  end
end
