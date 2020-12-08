# frozen_string_literal: true

require_relative 'puzzle05a'
require_relative 'puzzle05b'

RSpec.describe 'Puzzle05' do
  describe '5A' do
    it 'with test input' do
      expect(Puzzle05a.call("FBFBBFFRLR")).to eq(357)
      expect(Puzzle05a.call("BFFFBBFRRR")).to eq(567)
      expect(Puzzle05a.call("FFFBBBFRRR")).to eq(119)
      expect(Puzzle05a.call("BBFFBBFRLL")).to eq(820)
    end

    it 'with real input' do
      input = File.foreach('input.txt').map(&:strip)
      p	''
      p '--------------------'
      p 'Answer to Puzzle 05a'
      p input.map{|row| Puzzle05a.call(row)}.max
      p '--------------------'
    end
  end

  describe '5B' do
    it 'with real input' do
      input = File.foreach('input.txt').map(&:strip)
      p	''
      p '--------------------'
      p 'Answer to Puzzle 05b'
      p Puzzle05b.call(input)
      p '--------------------'
    end
  end
end
