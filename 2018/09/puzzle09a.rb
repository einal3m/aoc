RSpec.describe 'Puzzle09' do
  context 'examples' do
    it 'runs' do
      expect(do_it(no_of_players: 9, last_marble: 25)).to eq(32)
      expect(do_it(no_of_players: 10, last_marble: 1618)).to eq(8317)
      expect(do_it(no_of_players: 13, last_marble: 7999)).to eq(146_373)
      expect(do_it(no_of_players: 17, last_marble: 1104)).to eq(2764)
      expect(do_it(no_of_players: 21, last_marble: 6111)).to eq(54_718)
      expect(do_it(no_of_players: 30, last_marble: 5807)).to eq(37_305)
    end
  end

  context 'my input' do
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 09a'
      p do_it(no_of_players: 424, last_marble: 71_144)
      p '--------------------'

      p ''
      p '--------------------'
      p 'Answer to Puzzle 09b'
      p do_it(no_of_players: 424, last_marble: 7_114_400)
      p '--------------------'

      expect(do_it(no_of_players: 424, last_marble: 71_144)).to eq(405_143)
      expect(do_it(no_of_players: 424, last_marble: 7_114_400)).to eq(3_411_514_667)
    end
  end
end

def do_it(no_of_players:, last_marble:)
  current = { val: 0, next: nil, last: nil }
  current[:next] = current
  current[:last] = current

  scores = {}
  player = 0

  (1..last_marble).each do |marble|
    if (marble % 23).zero?
      7.times { current = current[:last] }

      deleted = current
      deleted[:last][:next] = deleted[:next]
      deleted[:next][:last] = deleted[:last]

      current = deleted[:next]

      scores[player] ||= 0
      scores[player] = scores[player] + marble + deleted[:val]
    else
      current = current[:next]
      new = { val: marble, next: current[:next], last: current }
      current = current[:next] = current[:next][:last] = new
    end

    player = (player + 1) % no_of_players
  end
  scores.values.max
end
