RSpec.describe 'Puzzle07b' do
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
      expect(do_it(input, 0, 2)).to eq(15)  
  	end
  end

  context 'my input' do
    let(:input) { File.readlines( 'input.txt' ).map { |x| x } }
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 07b'
      p do_it(input, 60, 5)
      p '--------------------'

      expect(do_it(input, 60, 5)).to eq(893)
    end
  end
end

def do_it(input, step, no_of_elves)
  orders = input.map do |line|
    line.match(/Step (.) must be finished before step (.) can begin./).captures
  end

  all_tasks = orders.flatten.uniq.sort
  time = 0
  result = []
  available_elves = no_of_elves
  working_elves = []

  while orders.any? || working_elves.any? do
    working_elves = working_elves.map do |elf| 
      [elf.first, elf.last + 1]
    end

    working_elves = working_elves.select do |elf| 
      if (elf.first.ord - 64 + step) == elf.last
        orders = orders.reject { |order| elf.first == order.first }
        available_elves += 1 
        false
      else
        true
      end
    end

    all_lasts = orders.map { |order| order.last }
    starting = all_tasks.reject { |task| all_lasts.include?(task) }.take(available_elves)

    starting.each do |task|
      working_elves << [task, 0]
      all_tasks.delete(task)
      available_elves -= 1
    end

    time += 1
  end

  time - 1
end
