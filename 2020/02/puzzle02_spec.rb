require_relative 'puzzle02a.rb'
require_relative 'puzzle02b.rb'

RSpec.describe 'Puzzle02' do
  describe '2A' do
    it 'with test input' do
      input = ['1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc' ]
      expect(Puzzle02a.(input)).to eq(2)
    end

    it 'with real input' do
     input = File.foreach( 'input.txt' )
     p	''
     p '--------------------'
     p 'Answer to Puzzle 02a'
     p Puzzle02a.(input)
     p '--------------------'
    end
  end

  describe '2B' do
    it 'with test input' do
      input = ['1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc' ]
      expect(Puzzle02a.(input)).to eq(2)
    end

    it 'with real input' do
      input = File.foreach( 'input.txt' )
      p	''
      p '--------------------'
      p 'Answer to Puzzle 02b'
      p Puzzle02b.(input)
      p '--------------------'
    end
  end
end
