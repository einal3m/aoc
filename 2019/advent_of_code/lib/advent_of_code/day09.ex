defmodule AdventOfCode.Day09 do

  def run_int_code(input, param \\ 0) do
    input
    |> Enum.with_index
    |> Enum.reduce(%{}, fn {code, index}, program -> Map.put(program, index, code) end)
    |> int_code(0, [param], [], 0)  
  end

  def int_code(input, index, param, outputs, relative_base) do
    {code, modes} = parse_code(Map.get(input, index))
    
    case code do
      1 -> # a + b => c
        {param1, param2, param3} = get_val_val_pos(input, index, modes, relative_base)

        Map.put(input, param3, param1 + param2)
        |> int_code(index + 4, param, outputs, relative_base)

      2 -> # a * b => c
        {param1, param2, param3} = get_val_val_pos(input, index, modes, relative_base)

        Map.put(input, param3, param1 * param2)
        |> int_code(index + 4, param, outputs, relative_base)

      3 -> # input => a
        param1 = get_pos(input, index, modes, relative_base)

        Map.put(input, param1, hd(param))
        |> int_code(index + 2, tl(param), outputs, relative_base)

      4 -> # output => a
        param1 = get_val(input, index, modes, relative_base)
        int_code(input, index + 2, param, outputs ++ [param1], relative_base)

      5 -> # jump if true
        {param1, param2} = get_val_val(input, index, modes, relative_base)
        new_index = if param1 != 0, do: param2, else: index + 3

        int_code(input, new_index, param, outputs, relative_base)

      6 -> # jump if false
        {param1, param2} = get_val_val(input, index, modes, relative_base)
        new_index = if param1 == 0, do: param2, else: index + 3

        int_code(input, new_index, param, outputs, relative_base)

      7 -> # less than => a < b 
        {param1, param2, param3} = get_val_val_pos(input, index, modes, relative_base)
        value = if param1 < param2, do: 1, else: 0

        Map.put(input, param3, value)
        |> int_code(index + 4, param, outputs, relative_base)     

      8 -> # equal => a == b => put 1/0 in c
        {param1, param2, param3} = get_val_val_pos(input, index, modes, relative_base)
        value = if param1 == param2, do: 1, else: 0

        Map.put(input, param3, value)
        |> int_code(index + 4, param, outputs, relative_base)

      9 -> # change relative_base 
        param1 = get_val(input, index, modes, relative_base)

        int_code(input, index + 2, param, outputs, relative_base + param1)

      99 ->
        outputs
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
