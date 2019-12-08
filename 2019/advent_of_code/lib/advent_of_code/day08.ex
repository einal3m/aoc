defmodule AdventOfCode.Day08 do
  def part_one(input, width, height) do
    list = split_list(input, width, height) 
    index = index_smallest_zeroes(list)
    smallest_layer = Enum.at(list, index)

    count(smallest_layer, "1") * count(smallest_layer, "2")
  end

  def split_list(input, width, height) do
    number_of_pixels_per_layer = width * height

    input
      |> String.codepoints
      |> Enum.chunk(number_of_pixels_per_layer)
  end

  def index_smallest_zeroes(list) do
    list
      |> Enum.map(fn digits -> count(digits, "0") end)
      |> Enum.with_index
      |> Enum.min_by(fn {count, index} -> count end)
      |> elem(1)
  end

  def count(list, digit) do
    Enum.count(list, fn d -> d == digit end)
  end

  def part_two(input, width, height) do
    create_image(input, width, height)
    |> print_image(width, height)
  end

  def print_image(image, width, height) do
    Enum.reduce(0..height-1, "", fn y, output ->
      Enum.reduce(0..width-1, output, fn x, line -> 
        pixel = case Map.get(image, {x,y}) do
          "0" -> " "
          "1" -> "I"
        end

        pixel = case x == width-1 do
          true -> pixel <> "\n"
          false -> pixel
        end

        line <> pixel
      end)
    end)
  end

  def create_image(input, width, height) do
    split_list(input, width, height)
    |> Enum.reduce(%{}, fn layer, acc -> process_layer(acc, layer, width) end)
  end

  def process_layer(image_acc, layer, width) do
    layer
    |> Enum.with_index
    |> Enum.reduce(image_acc, fn {pixel, index}, image ->
      x = Integer.mod(index, width)
      y = Integer.floor_div(index, width)

      p = case Map.get(image, {x,y}, "2") do
        "0" -> "0"
        "1" -> "1"
        "2" -> pixel
      end

      Map.put(image, {x,y}, p)
    end)
  end
end
