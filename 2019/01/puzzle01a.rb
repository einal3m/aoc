# https://adventofcode.com/2019/day/1

class Puzzle01a
  class << self
    def do_it
      total = 0
      File.foreach( 'numbers.txt' ) do |mass|
        total += fuel(mass.to_i)
      end
      total
    end

    def fuel(mass)
      (mass/3.0).floor - 2
    end
  end
end
