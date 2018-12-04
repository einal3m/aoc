require_relative 'puzzle03b.rb'

RSpec.describe 'Puzzle03b' do
  context 'one' do
  	let(:input) { ['#1 @ 1,3: 4x4', '#2 @ 3,1: 4x4', '#3 @ 5,5: 2x2'] }

  	it 'equals 4' do
      expect(Puzzle03b.do_it(input)).to eq('#3')  
  	end
  end

  context 'my input' do
    let(:input) { File.readlines( 'input.txt' ).map { |x| x } }
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 03b'
      p Puzzle03b.do_it(input)
      p '--------------------'
    end
  end
end



