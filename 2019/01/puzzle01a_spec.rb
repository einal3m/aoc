require_relative 'puzzle01a.rb'

RSpec.describe 'Puzzle01a' do
  context 'one' do
    it 'equals 2' do
      expect(Puzzle01a.fuel(12)).to eq(2)
    end
  end

  context 'two' do
    it 'equals 10' do
      expect(Puzzle01a.fuel(14)).to eq(2)
    end
  end

  context 'three' do
    it 'equals 5' do
      expect(Puzzle01a.fuel(1969)).to eq(654)
    end
  end

  context 'four' do
    it 'equals 14' do
      expect(Puzzle01a.fuel(100756)).to eq(33583)
    end
  end

  context 'my file' do
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 01a'
      p Puzzle01a.do_it
      p '--------------------'
    end
  end
end
