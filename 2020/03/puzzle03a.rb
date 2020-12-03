class Puzzle03a
  class << self
    def call(input, right = 3, down = 1)
      pos = { x: 0, y: 0 }

      map = input.map do |line|
        line.chars
      end

      width = map[0].length
      height = map.length

      tree_count = 0
      while true do
        pos = { x: pos[:x] + right, y: pos[:y] + down}
        break if pos[:y] >= height

        tree_count += 1 if map[pos[:y]][pos[:x] % width] == '#'
      end

      tree_count
    end
  end
end

