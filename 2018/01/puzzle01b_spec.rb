require_relative 'puzzle01b.rb'

RSpec.describe 'Puzzle01b' do
  context 'one' do
  	let(:input) { [+1, -1] }
  	it 'equals 0' do
      expect(Puzzle01b.do_it(input)).to eq(0)
  	end
  end

  context 'two' do
  	let(:input) { [+3, +3, +4, -2, -4] }
  	it 'equals 10' do
      expect(Puzzle01b.do_it(input)).to eq(10)
  	end
  end

  context 'three' do
  	let(:input) { [-6, +3, +8, +5, -6] }
  	it 'equals 5' do
      expect(Puzzle01b.do_it(input)).to eq(5)
  	end
  end

  context 'four' do
  	let(:input) { [+7, +7, -2, -7, -4] }
  	it 'equals 14' do
      expect(Puzzle01b.do_it(input)).to eq(14)
  	end
  end

  context 'my file' do
  	let(:input) { File.foreach( '../01/numbers.txt' ).map { |x| x.to_i } }
  	it 'equals what?' do
  	  p	''
	    p '--------------------'
	    p 'Answer to Puzzle 01b'
  	  p Puzzle01b.do_it(input)
	    p '--------------------'
  	end
  end
end
