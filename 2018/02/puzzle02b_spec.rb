require_relative 'puzzle02b.rb'

RSpec.describe 'Puzzle02b' do
  context 'one' do
  	let(:input) { ['abcde', 'fghij', 'klmno', 'pqrst', 'fguij', 'axcye', 'wvxyz'] }
  	it 'equals fgij' do
      expect(Puzzle02b.do_it(input)).to eq('fgij')  
  	end
  end

  context 'my input' do
    let(:input) { File.readlines( 'input.txt' ).map { |x| x } }
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 02b'
      p Puzzle02b.do_it(input)
      p '--------------------'
    end
  end
end
