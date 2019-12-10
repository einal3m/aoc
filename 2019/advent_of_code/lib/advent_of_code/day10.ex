defmodule AdventOfCode.Day10 do
  def part_one(input) do
    grid = initialise_grid(input)

    Enum.map(grid, fn point -> count_visible_asteroids(grid, point) end)
    |> Enum.max_by(fn {point, count} -> count end)
  end

  def initialise_grid(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index
    |> Enum.reduce([], fn {row, y}, acc -> 
      String.graphemes(row)
      |> Enum.with_index
      |> Enum.reduce(acc, fn {point, x}, acc2 -> 
        case point == "#" do
          true -> acc2 ++ [{x,y}]
          false -> acc2
        end
      end)
    end)
  end

  def count_visible_asteroids(grid, point = {x1,y1}) do
    visible = Enum.map(grid, fn {x2,y2} -> 
      cond do
        x1 == x2 && y1 == y2 -> {:same, :same}
        x1 == x2 && y1 > y2 -> {:infinity, :up}
        x1 == x2 && y1 < y2 -> {:infinity, :down}
        y1 == y2 && x1 < x2 -> {0, :right}
        y1 == y2 && x1 > x2 -> {0, :left}
        true -> if x1 > x2, do: {(y2-y1) / (x2-x1), :left}, else: {(y2-y1) / (x2-x1), :right}
      end
    end)
    |> Enum.uniq
    |> Kernel.length
    |> Kernel.-(1)

    {point, visible}
  end

  def part_two(input, point) do
    grid = initialise_grid(input)

    asteroid_stats(grid, point)
    |> Enum.at(199)
    |> elem(0)
  end

  def asteroid_stats(grid, point = {x1,y1}) do
    grid
    |> Enum.reject(fn grid_point -> grid_point == point end)
    |> Enum.map(fn {x2,y2} -> 
      cond do
        x1 == x2 && y1 == y2 -> {{x2,y2}, 0, 0}
        x1 == x2 && y1 > y2 -> {{x2,y2}, 0, distance({x1,y1}, {x2,y2})}
        x1 == x2 && y1 < y2 -> {{x2,y2}, 180, distance({x1,y1}, {x2,y2})}
        y1 == y2 && x1 < x2 -> {{x2,y2}, 90, distance({x1,y1}, {x2,y2})}
        y1 == y2 && x1 > x2 -> {{x2,y2}, 270, distance({x1,y1}, {x2,y2})}
        true -> {{x2,y2}, angle({x1,y1}, {x2,y2}), distance({x1,y1}, {x2,y2})}
      end
    end)
    |> Enum.sort_by(fn {_point, _angle, distance} -> distance end)
    |> Enum.sort_by(fn {_point, angle, _distance} -> angle end)
    |> Enum.chunk_by(fn {_point, angle, _distance} -> angle end) 
    |> Enum.map(fn list -> 
      Enum.with_index(list)
      |> Enum.map(fn {{p,a,d},i} -> {p,a,d,i} end)
    end)
    |> List.flatten
    |> Enum.sort_by(fn {_point, _angle, _distance, order} -> order end)
  end

  def angle({x1,y1}, {x2,y2}) do
    angle = :math.atan((x2-x1)/(y1-y2)) * 180 / :math.pi
    
    #{x1, y1} = {8, 3} 

    cond do 
      x1 > x2 && y1 > y2 -> 360 + angle   #{x2, y2} = {6, 0}
      x1 > x2 && y1 < y2 -> 180 + angle   # {x2, y2} = {4, 4}
      x1 < x2 && y1 > y2 -> angle         # {x2,y2} = {9, 0}
      x1 < x2 && y1 < y2 -> 180 + angle   # {x2, y2} = {16, 4}
    end
  end

  def distance({x1,y1}, {x2,y2}) do
    :math.sqrt((y2-y1)*(y2-y1) + (x2-x1)*(x2-x1))
  end
end
