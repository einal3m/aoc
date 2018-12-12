RSpec.describe 'Puzzle12' do
  context 'one' do
    let(:plants) { '#..#.#..##......###...###' }
    let(:input) do
      [
        '...## => #',
        '..#.. => #',
        '.#... => #',
        '.#.#. => #',
        '.#.## => #',
        '.##.. => #',
        '.#### => #',
        '#.#.# => #',
        '#.### => #',
        '##.#. => #',
        '##.## => #',
        '###.. => #',
        '###.# => #',
        '####. => #'
      ]
    end

    it 'runs' do
      expect(do_it(plants, input, 20)).to eq(325)
    end
  end

  context 'my input' do
    let(:input) { File.read('input.txt').split(/\s+/).map(&:to_i) }
    let(:plants) { '#....##.#.#.####..#.######..##.#.########..#...##...##...##.#.#...######.###....#...##..#.#....##.##' }

    let(:input) do
      [
        '.#.## => #',
        '.#.#. => #',
        '#.#.# => .',
        '.#### => .',
        '.#... => .',
        '#..## => .',
        '..#.# => #',
        '#.#.. => .',
        '##### => .',
        '....# => .',
        '...## => .',
        '..##. => .',
        '##.#. => #',
        '##..# => .',
        '##... => #',
        '..### => #',
        '.##.. => #',
        '###.. => .',
        '#..#. => .',
        '##.## => .',
        '..#.. => #',
        '.##.# => #',
        '####. => #',
        '#.### => .',
        '#...# => #',
        '###.# => #',
        '...#. => #',
        '.###. => .',
        '.#..# => #',
        '..... => .',
        '#.... => .',
        '#.##. => #'
      ]
    end

    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 12a'
      p do_it(plants, input, 20)
      p '--------------------'

      p ''
      p '--------------------'
      p 'Answer to Puzzle 12b'
      p do_it(plants, input, 50_000_000_000)
      p '--------------------'

      expect(do_it(plants, input, 20)).to eq(2444)
      expect(do_it(plants, input, 50_000_000_000)).to eq(750_000_000_697)
    end
  end
end

def do_it(plants, input, generations)
  matches = input.map do |match|
    sequence = match[0..4]
    result = match[-1] == '#'
    { sequence: sequence, grow: result }
  end

  zero = 0
  identical = false
  steps_done = 0
  leading_blanks = 0

  (1..generations).each do |step|
    leading_blanks = 4 - plants.index('#')
    trailing_blanks = 4 - plants.reverse.index('#')

    plants_with_extras = '.' * leading_blanks + plants + '.' * trailing_blanks
    zero += leading_blanks

    new_plants = ''
    (2..(plants_with_extras.length - 2)).each do |i|
      found = matches.detect { |match| match[:sequence] == plants_with_extras[(i - 2)..(i + 2)] }
      new_plants << (found && found[:grow] ? '#' : '.')
    end

    zero -= 2
    steps_done = step

    break if plants == new_plants
    plants = new_plants
  end

  steps_to_go = generations - steps_done
  zero -= steps_to_go * leading_blanks

  plants.chars.each_with_index.map { |plant, i| plant == '#' ? i - zero : 0 }.sum
end
