defmodule AdventOfCode.Day11 do
  def part_one(instructions) do
    int_code = AdventOfCode.IntCode.initialize_int_code(instructions)

    state = %AdventOfCode.IntCode{
      int_code: int_code, 
      index: 0, 
      relative_base: 0, 
      status: :running
    }

    paint_it(state, %{}, {0,0}, :up)
    |> Enum.count(fn {_point, colours} -> length(colours) end)
  end

  def part_two(instructions) do
    int_code = AdventOfCode.IntCode.initialize_int_code(instructions)

    state = %AdventOfCode.IntCode{
      int_code: int_code, 
      index: 0, 
      relative_base: 0, 
      status: :running
    }

    panels = paint_it(state, %{{0,0} => [1]}, {0,0}, :up)
    |> Enum.map(fn {point, colours} -> {point, hd(colours)} end)
    |> Map.new

    {{min_x, _}, _} = Enum.min_by(panels, fn {{x,_y}, _colours} -> x end)
    {{_,min_y}, _} = Enum.min_by(panels, fn {{_x,y}, _colours} -> y end)
    {{max_x, _}, _} = Enum.max_by(panels, fn {{x,_y}, _colours} -> x end)
    {{_,max_y}, _} = Enum.max_by(panels, fn {{_x,y}, _colours} -> y end)

    print_image(panels, min_x, max_x, min_y, max_y)
  end

  def print_image(image, min_x, max_x, min_y, max_y) do
    Enum.reduce(min_y..max_y, "", fn y, output ->
      Enum.reduce(min_x..max_x, output, fn x, line -> 
        pixel = case Map.get(image, {x,y}, 0) do
          0 -> " "
          1 -> "I"
        end

        pixel = case x == max_x do
          true -> pixel <> "\n"
          false -> pixel
        end

        line <> pixel
      end)
    end)
  end

  def paint_it(state, panels, {x,y}, direction) do
    colours = Map.get(panels, {x,y}, [0])
    current_colour = hd(colours)

    state = 
      state
      |> Map.put(:params, [current_colour])
      |> Map.put(:outputs, [])
      |> AdventOfCode.IntCode.run_until_output()
      |> AdventOfCode.IntCode.run_until_output()

    case state.status do
      :running ->
        [new_colour, instruction] = state.outputs
        
        new_colours = case current_colour == new_colour do
          true -> colours
          false -> [new_colour | colours]
        end

        panels = Map.put(panels, {x,y}, new_colours)

        {new_point,next_direction} = next_location({x, y}, direction, instruction)

        paint_it(state, panels, new_point, next_direction)
      :finished ->
        panels
    end
  end

  def next_location({current_x, current_y}, current_direction, new_direction) do
    case current_direction do
      :up -> if new_direction == 0, do: {{current_x-1, current_y}, :left}, else: {{current_x+1, current_y}, :right}
      :down -> if new_direction == 0, do: {{current_x+1, current_y}, :right}, else: {{current_x-1, current_y}, :left}
      :left -> if new_direction == 0, do: {{current_x, current_y+1}, :down}, else: {{current_x, current_y-1}, :up}
      :right -> if new_direction == 0, do: {{current_x, current_y-1}, :up}, else: {{current_x, current_y+1}, :down}
    end
  end
end
