# frozen_string_literal: true

require_relative 'puzzle06a'
require_relative 'puzzle06b'

RSpec.describe 'Puzzle06' do
  describe '6A' do
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

      expect(Puzzle06a.call(input)).to eq(11)
    end

    it 'with real input' do
      input = File.foreach('input.txt').map(&:strip)
      p	''
      p '--------------------'
      p 'Answer to Puzzle 06a'
      p Puzzle06a.call(input)
      p '--------------------'
    end
  end

  describe '6B' do
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

      expect(Puzzle06b.call(input)).to eq(6)
    end

    it 'with real input' do
      input = File.foreach('input.txt').map(&:strip)
      p	''
      p '--------------------'
      p 'Answer to Puzzle 06b'
      p Puzzle06b.call(input)
      p '--------------------'
    end
  end
end
