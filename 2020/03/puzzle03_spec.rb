require_relative 'puzzle03a.rb'
require_relative 'puzzle03b.rb'

RSpec.describe 'Puzzle03' do
  describe '3A' do
    it 'with test input' do
      input = [
        "..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#",
      ]
      expect(Puzzle03a.(input)).to eq(7)
    end

    it 'with real input' do
     input = File.foreach( 'input.txt' ).map { |x| x.strip }
     p	''
     p '--------------------'
     p 'Answer to Puzzle 03a'
     p Puzzle03a.(input)
     p '--------------------'
    end
  end

  describe '3B' do
    it 'with test input' do
      input = [
        "..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#",
      ]
      expect(Puzzle03b.(input)).to eq(336)
    end

    it 'with real input' do
      input = File.foreach( 'input.txt' ).map { |x| x.strip }
      p	''
      p '--------------------'
      p 'Answer to Puzzle 03b'
      p Puzzle03b.(input)
      p '--------------------'
    end
  end
end
