defmodule AdventOfCode.Day03 do
  def part_one(first_wire, second_wire) do
    MapSet.intersection(MapSet.new(generate_path(first_wire)), MapSet.new(generate_path(second_wire)))
    |> MapSet.to_list
    |> Enum.map(fn {x,y} -> abs(x) + abs(y) end)
    |> Enum.min
  end

  def part_two(first_wire, second_wire) do
    first_path = generate_path(first_wire)
    second_path = generate_path(second_wire)

    MapSet.intersection(MapSet.new(first_path), MapSet.new(second_path))
    |> MapSet.to_list
    |> Enum.map(fn elem -> 2 + Enum.find_index(first_path, fn x -> x == elem end) + Enum.find_index(second_path, fn x -> x == elem end) end)
    |> Enum.min
  end

  def generate_path(path) do
    {_x, _y, result} = String.split(path, ",", trim: true) 
    |> Enum.map(fn p -> String.split_at(p, 1) end)
    |> Enum.map(fn {a,b} -> {a, String.to_integer(b)} end)
    |> Enum.reduce({0, 0, []}, fn instruction, acc ->
      {x, y, paths} = acc
      case instruction do
        {"L", count} -> 
          {x-count, y, paths ++ Enum.map((x-1)..(x-count), fn new_x -> { new_x, y } end)}
        {"R", count} -> 
          {x+count, y, paths ++ Enum.map((x+1)..(x+count), fn new_x -> { new_x, y } end)}
        {"U", count} -> 
          {x, y+count, paths ++ Enum.map((y+1)..(y+count), fn new_y -> { x, new_y } end)}
        {"D", count} -> 
          {x, y-count, paths ++ Enum.map((y-1)..(y-count), fn new_y -> { x, new_y } end)}
      end
    end)
    
    result
  end
end
