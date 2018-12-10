RSpec.describe 'Puzzle08a' do
  context 'one' do
    let(:input) { [2, 3, 0, 3, 10, 11, 12, 1, 1, 0, 1, 99, 2, 1, 1, 2] }

    it 'equals 4' do
      expect(do_it(input)).to eq(138)
    end
  end

  context 'my input' do
    let(:input) { File.read('input.txt').split(/\s+/).map(&:to_i) }
    it 'equals what?' do
      p ''
      p '--------------------'
      p 'Answer to Puzzle 08a'
      p do_it(input)
      p '--------------------'

      expect(do_it(input)).to eq(36_027)
    end
  end
end

def do_it(input)
  metadata_count(0, input, 0).first
end

def metadata_count(count, input, index)
  no_children = input[index]
  no_metadata = input[index + 1]

  return [count, input, index] unless no_children
  return [input.slice(index + 2, no_metadata).inject(0, :+), index + no_metadata + 2] if no_children == 0

  child_meta_count = 0
  child_index = index + 2
  no_children.times.each do
    (count, child_index) = metadata_count(child_meta_count, input, child_index)
    child_meta_count += count
  end

  my_meta = input.slice(child_index, no_metadata).inject(0, :+)
  [child_meta_count + my_meta, child_index + no_metadata]
end
