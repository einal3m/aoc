defmodule AdventOfCode.Day05 do
  alias AdventOfCode.IntCode
  def part_one(codes, input \\ 0) do
    IntCode.initialize_int_code(codes)
    |> IntCode.run_until_done([input])
    |> Map.get(:outputs)  
  end
end
