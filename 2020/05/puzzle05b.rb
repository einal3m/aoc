# frozen_string_literal: true

require_relative 'puzzle05a'

class Puzzle05b
  class << self
    def call(input)
      taken_seats = input.map{|seat| Puzzle05a.call(seat)}

      (taken_seats.min..taken_seats.max).to_a - taken_seats
    end
  end
end
