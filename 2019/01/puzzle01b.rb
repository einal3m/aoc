# https://adventofcode.com/2019/day/1

class Puzzle01b
	class << self
    def do_it
      total = 0
      File.foreach( 'numbers.txt' ) do |mass|
        total += fuel(mass.to_i)
      end
      total
    end

    def fuel(mass)
      result = (mass/3.0).floor - 2

      return 0 if result <= 0
      return result + fuel(result)
    end
  end
end
