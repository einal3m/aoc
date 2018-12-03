class Puzzle02a
	class << self
	  def do_it(input)
	  	ids_with_doubles = 0
	  	ids_with_triples = 0

	  	input.each do |id|
	  		counts = id.chars.group_by { |c| c }
	  		ids_with_doubles +=1 if counts.values.any? { |c| c.length == 2 }
	  		ids_with_triples +=1 if counts.values.any? { |c| c.length == 3 }
		end	  

		p "doubles: #{ids_with_doubles}"
		p "doubles: #{ids_with_triples}"

		ids_with_doubles * ids_with_triples		
	  end
	end
end
