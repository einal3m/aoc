class Puzzle02b
	class << self
	  def do_it(ids)
	  	ids.each_with_index do |id, i|
	  		start_index = i + 1
	  		end_index = ids.length - 1

	  		next if start_index > ids.length

	  		(start_index..end_index).each do |index|

	  			length = id.length

	  			diffs = (0..length-1).map { |j| id[j] == ids[index][j] ? 0 : 1 }
	  			diff_count = diffs.inject(0, :+)

	  			p "compare #{id} with #{ids[index]}, diff: #{diff_count}" if diff_count == 1
	  		end
	  	end	
	  end
	end
end
