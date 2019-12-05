defmodule AdventOfCode.Day05 do
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
        List.replace_at(input, Enum.at(input, index+1), param)
        |> int_code(index + 2, param, outputs)

      4 -> # output
        param1 = case Enum.at(modes, 0) do
          0 -> Enum.at(input, Enum.at(input, index + 1))
          1 -> Enum.at(input, index + 1)
        end
        int_code(input, index + 2, param, [param1] ++ outputs)

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
        outputs
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
