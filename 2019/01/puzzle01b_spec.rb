require_relative 'puzzle01b.rb'

RSpec.describe 'Puzzle01b' do
  context 'one' do
    it 'equals 2' do
      expect(Puzzle01b.fuel(12)).to eq(2)
    end
  end

  context 'two' do
    it 'equals 10' do
      expect(Puzzle01b.fuel(1969)).to eq(966)
    end
  end

  context 'four' do
    it 'equals 14' do
      expect(Puzzle01b.fuel(100756)).to eq(50346)
    end
  end

  context 'my file' do
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 01b'
      p Puzzle01b.do_it
      p '--------------------'
    end
  end
end
