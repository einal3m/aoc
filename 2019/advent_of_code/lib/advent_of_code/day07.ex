defmodule AdventOfCode.Day07 do
  def part_one(instructions) do
    permutations([0, 1, 2, 3, 4])
    |> Enum.map(fn phase_settings -> run_amplifiers(instructions, phase_settings) end)
    |> Enum.max
  end

  def run_amplifiers(instructions, phase_settings) do
    Enum.reduce(phase_settings, 0, fn setting, acc -> hd(output(instructions, [setting, acc])) end)
  end

  def output(instructions, inputs) do
    int_code(instructions, 0, inputs, [])
  end

  def feedback_amplifiers(instructions, phases) do
    inputs = Enum.map(phases, fn phase -> [instructions, 0, phase] end)

    result = Enum.reduce(inputs, [[], [], 0], 
      fn [codes, index, phase], [states, indexes, input] -> 
        [state, current_index, output] = int_code(codes, index, [phase, input], []) 
        [states ++ [state], indexes ++ [current_index], output]
      end
    )

    do_it(result)
    |> List.flatten
    |> hd
  end

  def do_it(all_states) do
    [states, indexes, output] = Enum.reduce(0..4, all_states, 
      fn index, [states, indexes, input] -> 
         case int_code(Enum.at(states, index), Enum.at(indexes, index), [input], []) do
          [:end, output] ->
            [states, List.replace_at(indexes, index, -1), output]
          [current_state, current_index, output] ->
            [List.replace_at(states, index, current_state), List.replace_at(indexes, index, current_index), output]
          end
      end
    )
    case Enum.sum(indexes) < 0 do
      true -> output
      false -> do_it([states, indexes, output])
    end
  end

  def part_two(instructions) do
    permutations([5, 6, 7, 8, 9])
    |> Enum.map(fn phase_settings -> feedback_amplifiers(instructions, phase_settings) end)
    |> Enum.max
  end

  def permutations([]) do
    [[]] 
  end

  def permutations(list) do
    for elem <- list, rest <- permutations(list--[elem]), do: [elem|rest] 
  end

def int_code(input, index, param, outputs) do
    {code, modes} = parse_code(Enum.at(input, index))
    
    case code do
      1 -> # a + b
        param1 = case Enum.at(modes, 2) do
          0 -> Enum.at(input, Enum.at(input, index + 1))
          1 -> Enum.at(input, index + 1)
        end
        param2 = case Enum.at(modes, 1) do
          0 -> Enum.at(input, Enum.at(input, index + 2))
          1 -> Enum.at(input, index + 2)
        end
        List.replace_at(input, Enum.at(input, index + 3), param1 + param2)
        |> int_code(index + 4, param, outputs)

      2 -> # a * b
        param1 = case Enum.at(modes, 2) do
          0 -> Enum.at(input, Enum.at(input, index + 1))
          1 -> Enum.at(input, index + 1)
        end

        param2 = case Enum.at(modes, 1) do
          0 -> Enum.at(input, Enum.at(input, index + 2))
          1 -> Enum.at(input, index + 2)
        end
        List.replace_at(input, Enum.at(input, index + 3), param1 * param2)
        |> int_code(index + 4, param, outputs)

      3 -> # input
        List.replace_at(input, Enum.at(input, index+1), hd(param))
        |> int_code(index + 2, tl(param), outputs)

      4 -> # output
        param1 = case Enum.at(modes, 0) do
          0 -> Enum.at(input, Enum.at(input, index + 1))
          1 -> Enum.at(input, index + 1)
        end
        [input, index + 2, param1]

      5 -> # jump if true
        param1 = case Enum.at(modes, 1) do
          0 -> Enum.at(input, Enum.at(input, index + 1))
          1 -> Enum.at(input, index + 1)
        end
        param2 = case Enum.at(modes, 0) do
          0 -> Enum.at(input, Enum.at(input, index + 2))
          1 -> Enum.at(input, index + 2)
        end

        new_index = if param1 != 0 do
            param2
          else
            index + 3
        end
        int_code(input, new_index, param, outputs)

      6 -> # jump if false
        param1 = case Enum.at(modes, 1) do
          0 -> Enum.at(input, Enum.at(input, index + 1))
          1 -> Enum.at(input, index + 1)
        end
        param2 = case Enum.at(modes, 0) do
          0 -> Enum.at(input, Enum.at(input, index + 2))
          1 -> Enum.at(input, index + 2)
        end

        new_index = if param1 == 0 do
            param2
          else
            index + 3
        end
        int_code(input, new_index, param, outputs)

      7 -> # less than
        param1 = case Enum.at(modes, 2) do
          0 -> Enum.at(input, Enum.at(input, index + 1))
          1 -> Enum.at(input, index + 1)
        end

        param2 = case Enum.at(modes, 1) do
          0 -> Enum.at(input, Enum.at(input, index + 2))
          1 -> Enum.at(input, index + 2)
        end

        value = if param1 < param2 do
          1
        else
          0
        end
        List.replace_at(input, Enum.at(input, index + 3), value)
        |> int_code(index + 4, param, outputs)     

      8 -> # equal
        param1 = case Enum.at(modes, 2) do
          0 -> Enum.at(input, Enum.at(input, index + 1))
          1 -> Enum.at(input, index + 1)
        end

        param2 = case Enum.at(modes, 1) do
          0 -> Enum.at(input, Enum.at(input, index + 2))
          1 -> Enum.at(input, index + 2)
        end

        value = if param1 == param2 do
          1
        else
          0
        end
        List.replace_at(input, Enum.at(input, index + 3), value)
        |> int_code(index + 4, param, outputs)  

      9 ->
        [:end, param]
    end
  end

  def parse_code(code) do
    digits = Integer.digits(code)
    actual_code = List.last(digits)

    params = Enum.drop(digits, -2) 
      |> Enum.join("") 
      |> String.pad_leading(param_counts(actual_code), "0") 
      |> String.graphemes
      |> Enum.map(fn x -> String.to_integer(x) end)

    { actual_code, params }
  end

  def param_counts(code) do
    Enum.at([3,3,1,1,2,2,3,3,1], code-1)
  end  
end
