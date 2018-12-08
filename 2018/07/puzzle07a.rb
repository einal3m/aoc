RSpec.describe 'Puzzle07a' do
  context 'one' do
    let(:input) do
      [
        'Step C must be finished before step A can begin.',
        'Step C must be finished before step F can begin.',
        'Step A must be finished before step B can begin.',
        'Step A must be finished before step D can begin.',
        'Step B must be finished before step E can begin.',
        'Step D must be finished before step E can begin.',
        'Step F must be finished before step E can begin.'
      ]
    end

    it 'equals 4' do
      expect(do_it(input)).to eq('CABDFE')  
    end
  end

  context 'my input' do
    let(:input) { File.readlines( 'input.txt' ).map { |x| x } }
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 07a'
      p do_it(input)
      p '--------------------'

      expect(do_it(input)).to eq('MNOUBYITKXZFHQRJDASGCPEVWL')  
    end
  end
end


def do_it(input)
  orders = input.map do |line|
    line.match(/Step (.) must be finished before step (.) can begin./).captures
  end

  all_tasks = orders.flatten.uniq.sort
  result = []

  while !orders.empty? do
    all_lasts = orders.map { |order| order.last }
    ready = all_tasks.reject { |task| all_lasts.include?(task) }.first
    result << ready
    orders = orders.reject { |order| ready == order.first }
    all_tasks.delete(ready)
  end

  (result + all_tasks).flatten.join
end
