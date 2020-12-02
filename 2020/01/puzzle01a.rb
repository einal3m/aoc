class Puzzle01a
  class << self
    def call(input)
      input.each_with_index do |num_i, i|
        input.each_with_index do |num_j, j|
          next if j < i
          next if num_i + num_j != 2020
          return num_i * num_j
        end
      end
    end
  end
end
