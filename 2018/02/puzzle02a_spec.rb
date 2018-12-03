require_relative 'puzzle02a.rb'

RSpec.describe 'Puzzle02a' do
  context 'one' do
  	let(:input) { ['abcdef', 'bababc', 'abbcde', 'abcccd', 'aabcdd', 'abcdee', 'ababab'] }
  	it 'equals 0' do
      expect(Puzzle02a.do_it(input)).to eq(12)  
  	end
  end

  context 'my input' do
    let(:input) { File.readlines( 'input.txt' ).map { |x| x } }
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 02a'
      p Puzzle02a.do_it(input)
      p '--------------------'
    end
  end
end
