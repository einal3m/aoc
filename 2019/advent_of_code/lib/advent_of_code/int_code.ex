defmodule AdventOfCode.IntCode do
  alias AdventOfCode.IntCode
  defstruct instructions: %{}, index: 0, params: [], outputs: [], relative_base: 0

  def initialize_instructions(instructions) do
    instructions
    |> Enum.with_index
    |> Enum.reduce(%{}, fn {code, index}, codes -> Map.put(codes, index, code) end)    
  end

  def run_until_done(instructions, inputs) do
    run(instructions, 0, inputs, [], 0)
  end

  def run(input, index, param, outputs, relative_base) do
    %IntCode{instructions: input, index: index, params: param, outputs: outputs, relative_base: relative_base}
    |> run
  end

  def run(state = %IntCode{instructions: input, index: index, params: param, outputs: outputs, relative_base: relative_base}) do
    {code, modes} = parse_code(Map.get(input, index))
    
    case code do
      1 -> # a + b => c
        {param1, param2, param3} = get_val_val_pos(input, index, modes, relative_base)

        Map.put(input, param3, param1 + param2)
        |> run(index + 4, param, outputs, relative_base)

      2 -> # a * b => c
        {param1, param2, param3} = get_val_val_pos(input, index, modes, relative_base)

        Map.put(input, param3, param1 * param2)
        |> run(index + 4, param, outputs, relative_base)

      3 -> # input => a
        param1 = get_pos(input, index, modes, relative_base)

        Map.put(input, param1, hd(param))
        |> run(index + 2, tl(param), outputs, relative_base)

      4 -> # output => a
        param1 = get_val(input, index, modes, relative_base)
        run(input, index + 2, param, outputs ++ [param1], relative_base)

      5 -> # jump if true
        {param1, param2} = get_val_val(input, index, modes, relative_base)
        new_index = if param1 != 0, do: param2, else: index + 3

        run(input, new_index, param, outputs, relative_base)

      6 -> # jump if false
        {param1, param2} = get_val_val(input, index, modes, relative_base)
        new_index = if param1 == 0, do: param2, else: index + 3

        run(input, new_index, param, outputs, relative_base)

      7 -> # less than => a < b 
        {param1, param2, param3} = get_val_val_pos(input, index, modes, relative_base)
        value = if param1 < param2, do: 1, else: 0

        Map.put(input, param3, value)
        |> run(index + 4, param, outputs, relative_base)     

      8 -> # equal => a == b => put 1/0 in c
        {param1, param2, param3} = get_val_val_pos(input, index, modes, relative_base)
        value = if param1 == param2, do: 1, else: 0

        Map.put(input, param3, value)
        |> run(index + 4, param, outputs, relative_base)

      9 -> # change relative_base 
        param1 = get_val(input, index, modes, relative_base)

        run(input, index + 2, param, outputs, relative_base + param1)

      99 ->
        state
    end
  end

  def get_val_val_pos(input, index, modes, relative_base) do
    param1 = case Enum.at(modes, 2) do
      0 -> Map.get(input, Map.get(input, index + 1), 0)
      1 -> Map.get(input, index + 1)
      2 -> Map.get(input, Map.get(input, index+1) + relative_base, 0)
    end
    param2 = case Enum.at(modes, 1) do
      0 -> Map.get(input, Map.get(input, index + 2), 0)
      1 -> Map.get(input, index + 2)
      2 -> Map.get(input, Map.get(input, index+2) + relative_base, 0)
    end
    param3 = case Enum.at(modes, 0) do
      0 -> Map.get(input, index + 3)
      2 -> Map.get(input, index + 3) + relative_base
    end

    {param1, param2, param3}
  end

  def get_val_val(input, index, modes, relative_base) do
    param1 = case Enum.at(modes, 1) do
      0 -> Map.get(input, Map.get(input, index + 1), 0)
      1 -> Map.get(input, index + 1)
      2 -> Map.get(input, Map.get(input, index+1) + relative_base, 0)
    end
    param2 = case Enum.at(modes, 0) do
      0 -> Map.get(input, Map.get(input, index + 2), 0)
      1 -> Map.get(input, index + 2)
      2 -> Map.get(input, Map.get(input, index+2) + relative_base, 0)
    end
    {param1, param2}    
  end

  def get_val(input, index, modes, relative_base) do
    case Enum.at(modes, 0) do
      0 -> Map.get(input, Map.get(input, index + 1), 0)
      1 -> Map.get(input, index + 1)
      2 -> Map.get(input, Map.get(input, index + 1) + relative_base, 0)
    end    
  end

  def get_pos(input, index, modes, relative_base) do
    case Enum.at(modes, 0) do
      0 -> Map.get(input, index + 1)
      2 -> Map.get(input, index + 1) + relative_base
    end      
  end

  def parse_code(code) do
    digits = Integer.digits(code)
    actual_code = Enum.take(digits, -2) |> Enum.join |> String.to_integer

    case actual_code == 99 do 
      true -> { 99, [] }
      false ->
        params = Enum.drop(digits, -2) 
          |> Enum.join("") 
          |> String.pad_leading(param_counts(actual_code), "0") 
          |> String.graphemes
          |> Enum.map(fn x -> String.to_integer(x) end)

        { actual_code, params }
    end
  end

  def param_counts(code) do
    Enum.at([3,3,1,1,2,2,3,3,1,1], code-1)
  end  
end
