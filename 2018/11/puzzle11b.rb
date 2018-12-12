RSpec.describe 'Puzzle11b' do
  context 'one' do
    it 'runs' do
      expect(do_it(18)).to eq([90, 269, 16])
      expect(do_it(42)).to eq([232, 251, 12])
    end
  end

  context 'my input' do
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 11b'
      p do_it(2568)
      p '--------------------'

      expect(do_it(2568)).to eq([90, 201, 15])
    end
  end
end

def do_it(serial_number)
  highest_power = 0
  highest_cell = [0, 0]

  grid = initialize_grid(serial_number)

  (1..300).each do |size|
    (1..(300 - size + 1)).each do |y|
      (1..(300 - size + 1)).each do |x|
        power = grid[(x - 1)..(x + size - 2)].map { |col| col[(y - 1)..(y + size - 2)].sum }.sum

        if power > highest_power
          highest_cell = [x, y, size]
          highest_power = power
        end
      end
    end
  end

  highest_cell
end

def initialize_grid(serial_number)
  (1..300).map do |x|
    (1..300).map { |y| power_level(x: x, y: y, serial_number: serial_number) }
  end
end

def power_level(x:, y:, serial_number:)
  ((((x + 10) * y + serial_number) * (x + 10)).to_s[-3].to_i || 0) - 5
end
