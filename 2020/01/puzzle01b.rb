class Puzzle01b
  class << self
    def call(input)
      input.each_with_index do |num_i, i|
        input.each_with_index do |num_j, j|
          input.each_with_index do |num_k, k|
            next if j < i
            next if k < j
            next if num_i + num_j +num_k != 2020
            return num_i * num_j * num_k
          end
        end
      end
    end
  end
end
