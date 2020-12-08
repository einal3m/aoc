# frozen_string_literal: true

class Puzzle05a
  class << self
    def call(input)
      input = input.gsub("F", "0")
      input = input.gsub("B", "1")
      input = input.gsub("L", "0")
      input = input.gsub("R", "1")

      row = input[0..6].to_i(2)
      seat = input[7..9].to_i(2)

      row * 8 + seat
    end
  end
end
