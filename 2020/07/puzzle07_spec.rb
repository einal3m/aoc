# frozen_string_literal: true

require_relative 'puzzle07a'
require_relative 'puzzle07b'

RSpec.describe 'Puzzle07' do
  describe '07A' do
    it 'with test input' do
      input = [
        "abc",
        "",
        "a",
        "b",
        "c",
        "",
        "ab",
        "ac",
        "",
        "a",
        "a",
        "a",
        "a",
        "",
        "b",
      ]

      expect(Puzzle07a.call(input)).to eq(11)
    end

    it 'with real input' do
      input = File.foreach('input.txt').map(&:strip)
      p	''
      p '--------------------'
      p 'Answer to Puzzle 07a'
      p Puzzle07a.call(input)
      p '--------------------'
    end
  end

  describe '07B' do
    it 'with test input' do
      input = [
        "abc",
        "",
        "a",
        "b",
        "c",
        "",
        "ab",
        "ac",
        "",
        "a",
        "a",
        "a",
        "a",
        "",
        "b",
      ]

      expect(Puzzle07b.call(input)).to eq(6)
    end

    it 'with real input' do
      input = File.foreach('input.txt').map(&:strip)
      p	''
      p '--------------------'
      p 'Answer to Puzzle 07b'
      p Puzzle07b.call(input)
      p '--------------------'
    end
  end
end
