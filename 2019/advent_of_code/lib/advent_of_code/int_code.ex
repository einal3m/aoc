defmodule AdventOfCode.IntCode do
  alias AdventOfCode.IntCode
  defstruct int_code: %{}, index: 0, params: [], outputs: [], relative_base: 0, status: :running

  def initialize_int_code(instructions) do
    instructions
    |> Enum.with_index
    |> Enum.reduce(%{}, fn {code, index}, codes -> Map.put(codes, index, code) end)    
  end

  def run_until_output(int_code, inputs) do
    %IntCode{
      int_code: int_code,
      index: 0,
      params: inputs,
      outputs: [],
      relative_base: 0,
      status: :running
    }
    |> run()

  end

  def run_until_output(state = %IntCode{}) do
    run(state)
  end

  def run_until_done(int_code, inputs) do
    %IntCode{
      int_code: int_code,
      index: 0,
      params: inputs,
      outputs: [],
      relative_base: 0,
      status: :running
    }
    |> run_until_done()
  end

  def run_until_done(state = %IntCode{}) do
    new_state = run(state)

    case new_state.status do
      :running -> run_until_done(new_state)
      :finished -> new_state
    end
  end

  def run(state = %IntCode{int_code: int_code, index: index, params: param, outputs: outputs, relative_base: relative_base, status: status}) do
    {code, modes} = parse_code(Map.get(int_code, index))
    
    case code do
      1 -> # a + b => c
        {param1, param2, param3} = get_val_val_pos(int_code, index, modes, relative_base)

        state
        |> Map.put(:int_code, Map.put(int_code, param3, param1 + param2))
        |> Map.put(:index, index + 4)
        |> run()

      2 -> # a * b => c
        {param1, param2, param3} = get_val_val_pos(int_code, index, modes, relative_base)

        state
        |> Map.put(:int_code, Map.put(int_code, param3, param1 * param2))
        |> Map.put(:index, index + 4)
        |> run()

      3 -> # input => a
        param1 = get_pos(int_code, index, modes, relative_base)

        state
        |> Map.put(:int_code, Map.put(int_code, param1, hd(param)))
        |> Map.put(:params, tl(param))
        |> Map.put(:index, index + 2)
        |> run()

      4 -> # output => a
        param1 = get_val(int_code, index, modes, relative_base)

        state
        |> Map.put(:outputs, outputs ++ [param1])
        |> Map.put(:index, index + 2)

      5 -> # jump if true
        {param1, param2} = get_val_val(int_code, index, modes, relative_base)
        new_index = if param1 != 0, do: param2, else: index + 3

        state
        |> Map.put(:index, new_index)
        |> run()

      6 -> # jump if false
        {param1, param2} = get_val_val(int_code, index, modes, relative_base)
        new_index = if param1 == 0, do: param2, else: index + 3

        state
        |> Map.put(:index, new_index)
        |> run()

      7 -> # less than => a < b 
        {param1, param2, param3} = get_val_val_pos(int_code, index, modes, relative_base)
        value = if param1 < param2, do: 1, else: 0

        state
        |> Map.put(:int_code, Map.put(int_code, param3, value))
        |> Map.put(:index, index + 4)
        |> run()

      8 -> # equal => a == b => put 1/0 in c
        {param1, param2, param3} = get_val_val_pos(int_code, index, modes, relative_base)
        value = if param1 == param2, do: 1, else: 0

        state
        |> Map.put(:int_code, Map.put(int_code, param3, value))
        |> Map.put(:index, index + 4)
        |> run()

      9 -> # change relative_base 
        param1 = get_val(int_code, index, modes, relative_base)

        state
        |> Map.put(:index, index + 2)
        |> Map.put(:relative_base, relative_base + param1)
        |> run()

      99 ->
        state
        |> Map.put(:status, :finished)
    end
  end

  def get_val_val_pos(int_code, index, modes, relative_base) do
    param1 = case Enum.at(modes, 2) do
      0 -> Map.get(int_code, Map.get(int_code, index + 1), 0)
      1 -> Map.get(int_code, index + 1)
      2 -> Map.get(int_code, Map.get(int_code, index+1) + relative_base, 0)
    end
    param2 = case Enum.at(modes, 1) do
      0 -> Map.get(int_code, Map.get(int_code, index + 2), 0)
      1 -> Map.get(int_code, index + 2)
      2 -> Map.get(int_code, Map.get(int_code, index+2) + relative_base, 0)
    end
    param3 = case Enum.at(modes, 0) do
      0 -> Map.get(int_code, index + 3)
      2 -> Map.get(int_code, index + 3) + relative_base
    end

    {param1, param2, param3}
  end

  def get_val_val(int_code, index, modes, relative_base) do
    param1 = case Enum.at(modes, 1) do
      0 -> Map.get(int_code, Map.get(int_code, index + 1), 0)
      1 -> Map.get(int_code, index + 1)
      2 -> Map.get(int_code, Map.get(int_code, index+1) + relative_base, 0)
    end
    param2 = case Enum.at(modes, 0) do
      0 -> Map.get(int_code, Map.get(int_code, index + 2), 0)
      1 -> Map.get(int_code, index + 2)
      2 -> Map.get(int_code, Map.get(int_code, index+2) + relative_base, 0)
    end
    {param1, param2}    
  end

  def get_val(int_code, index, modes, relative_base) do
    case Enum.at(modes, 0) do
      0 -> Map.get(int_code, Map.get(int_code, index + 1), 0)
      1 -> Map.get(int_code, index + 1)
      2 -> Map.get(int_code, Map.get(int_code, index + 1) + relative_base, 0)
    end    
  end

  def get_pos(int_code, index, modes, relative_base) do
    case Enum.at(modes, 0) do
      0 -> Map.get(int_code, index + 1)
      2 -> Map.get(int_code, index + 1) + relative_base
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
