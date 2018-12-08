RSpec.describe 'Puzzle05a' do
  context 'one' do
    let(:input) { 'dabAcCaCBAcCcaDA' }

    it 'equals 4' do
      expect(do_it(input)).to eq(10)
    end
  end

  context 'my input' do
    let(:input) { File.read('input.txt') }
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 05a'
      p do_it(input)
      p '--------------------'

      expect(do_it(input)).to eq(10_584)
    end
  end
end

def do_it(input)
  chars = input.chars
  i = 0

  loop do
    if (chars[i] != chars[i + 1]) && chars[i].casecmp(chars[i + 1]).zero?
      chars.delete_at(i)
      chars.delete_at(i)
      i = [0, i - 2].max
    else
      i += 1
    end

    return chars.length if i == chars.length - 1
  end
end
