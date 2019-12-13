defmodule AdventOfCode.Day13 do
  alias AdventOfCode.IntCode

  def part_one(instructions) do
    AdventOfCode.IntCode.initialize_int_code(instructions)
    |> AdventOfCode.IntCode.run_until_done([])
    |> Map.get(:outputs)
    |> Enum.chunk_every(3)
    |> Enum.count(fn [_x,_y,id] -> id == 2 end)
  end

  def part_two(instructions) do
    int_code = 
      instructions
      |> AdventOfCode.IntCode.initialize_int_code() 
      |> Map.put(0, 2)

    inputs = File.read!("Day13.input")
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

    initial_state = %IntCode{
      int_code: int_code,
      index: 0,
      outputs: [],
      inputs: inputs,
      relative_base: 0,
      status: :running
    }

    state = AdventOfCode.IntCode.run_until_input(initial_state)
    board = draw_board(%{}, state)

    run_until_end(board, state, inputs)
  end

  def run_until_end(board, state, inputs) do
    case state.status do
      :waiting -> 
        input = get_input()

        state = 
          state
          |> Map.put(:inputs, [input])
          |> Map.put(:outputs, [])
          |> Map.put(:status, :running)
          |> AdventOfCode.IntCode.run_until_input()

          board = draw_board(board, state)
          run_until_end(board, state, inputs ++ [input])

      :finished -> 
        File.write("Day13.input", inputs |> Enum.join(","))
    end
  end

  def get_input() do
    input = IO.gets("> ")

    case input do
      "\n" -> 0
      "1\n" -> -1
      "2\n" -> 1
      _ -> get_input()
    end
  end


  def draw_board(board, state) do
    board = 
      state
      |> Map.get(:outputs)
      |> Enum.chunk_every(3)
      |> Enum.reduce(board, fn [x,y,id], acc -> Map.put(acc, {x,y}, tile_type(id, x, y)) end)

    {{max_x, _}, _} = Enum.max_by(board, fn {{x,_y}, _tile} -> x end)
    {{_,max_y}, _} = Enum.max_by(board, fn {{_x,y}, _tile} -> y end)

    Enum.reduce(0..max_y, "", fn y, output ->
      Enum.reduce(0..max_x, output, fn x, line -> 
        pixel = case Map.get(board, {x,y}, :empty) do
          :empty -> " "
          :wall -> "\u2588"
          :block -> "\u25A7"
          :paddle -> "\u2582"
          :ball -> "\u25C9"
        end

        pixel = case x == max_x do
          true -> pixel <> "\n"
          false -> pixel
        end

        line <> pixel
      end)
    end) |> IO.puts

    board
  end

  def tile_type(id, x, y) do
    case id do
      0 -> :empty
      1 -> :wall
      2 -> :block
      3 -> :paddle
      4 -> :ball
      _ -> 
        IO.puts "-----------"
        IO.puts "SCORE: " <> Integer.to_string(id)
        IO.puts "-----------"
        :score
    end
  end
end
