RSpec.describe 'Puzzle11a' do
  describe 'power level' do
    it 'is correct' do
      expect(power_level(x: 3, y: 5, serial_number: 8)).to eq(4)
      expect(power_level(x: 122, y: 79, serial_number: 57)).to eq(-5)
      expect(power_level(x: 217, y: 196, serial_number: 39)).to eq(0)
      expect(power_level(x: 101, y: 153, serial_number: 71)).to eq(4)
    end
  end

  context 'one' do
    it 'runs' do
      expect(do_it(18)).to eq([33, 45])
      expect(do_it(42)).to eq([21, 61])
    end
  end

  context 'my input' do
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 11a'
      p do_it(2568)
      p '--------------------'

      expect(do_it(2568)).to eq([21, 68])
    end
  end
end

def do_it(serial_number)
  highest_power = 0
  highest_cell = [0, 0]

  grid = initialize_grid(serial_number)

  (1..298).each do |y|
    (1..298).each do |x|
      small_grid = grid[(x - 1)..(x + 1)].map { |col| col[(y - 1)..(y + 1)] }
      power = small_grid.flatten.sum

      if power > highest_power
        highest_cell = [x, y]
        highest_power = power
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
