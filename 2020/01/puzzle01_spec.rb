require_relative 'puzzle01a.rb'
require_relative 'puzzle01b.rb'

RSpec.describe 'Puzzle01' do
  describe '1A' do
    it 'with test input' do
      input = [1721, 979, 366, 299, 675, 1456]
      expect(Puzzle01a.(input)).to eq(514579)
    end

    it 'with real input' do
     input = File.foreach( 'input.txt' ).map { |x| x.to_i }
     p	''
     p '--------------------'
     p 'Answer to Puzzle 01a'
     p Puzzle01a.(input)
     p '--------------------'
    end
  end

  describe '1B' do
    it 'with test input' do
      input = [1721, 979, 366, 299, 675, 1456]
      expect(Puzzle01b.(input)).to eq(241861950)
    end

    it 'with real input' do
      input = File.foreach( 'input.txt' ).map { |x| x.to_i }
      p	''
      p '--------------------'
      p 'Answer to Puzzle 01b'
      p Puzzle01b.(input)
      p '--------------------'
    end
  end
end
