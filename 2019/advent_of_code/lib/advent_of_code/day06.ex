defmodule AdventOfCode.Day06 do
  def part_one(input) do
    input 
    |> Enum.map(fn orbit -> String.split(orbit, ")") end) 
    |> Enum.reduce(%{}, fn [a,b], acc -> Map.put(acc, a, Map.get(acc, a, [])++[b]) end)
    |> path_sums("COM", 0)
  end

  def path_sums(map, location, value) do
    case Map.fetch(map, location) do
      :error ->
        value
      {:ok, next} ->
        path_sum = Enum.map(next, fn l -> path_sums(map, l, value+1) end) |> Enum.sum
        path_sum + value
    end
  end

  def part_two(input) do
    map =  
      input
      |> Enum.map(fn orbit -> String.split(orbit, ")") end) 
      |> Enum.reduce(%{}, fn [a,b], acc -> Map.put(acc, a, Map.get(acc, a, [])++[b]) end)

    you_path = path_length(map, "COM", "YOU")  
    san_path = path_length(map, "COM", "SAN")  

    length((you_path -- san_path) ++ (san_path -- you_path)) - 2
  end

  def path_length(_map, start, finish) when start == finish do
    [start]
  end

  def path_length(map, start, finish) do
    case Map.fetch(map, start) do
      :error ->
        []
      {:ok, next} ->
        result = Enum.map(next, fn l -> path_length(map, l, finish) end) |> List.flatten
        case result do
          [] ->
            []
          other ->
            [start] ++ other
        end
    end
  end
end
