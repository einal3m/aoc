require_relative 'puzzle03a.rb'

class Puzzle03b
  class << self
    def call(input)
      Puzzle03a.(input, 1, 1) * Puzzle03a.(input, 3, 1) * Puzzle03a.(input, 5, 1) * Puzzle03a.(input, 7, 1) * Puzzle03a.(input, 1, 2)
    end
  end
end
