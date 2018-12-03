class Puzzle02
	class << self
	  def do_it(input)
	  	frequency = 0
	  	frequencies = { frequency => frequency}
	  	i = 0

	  	while true do
	  	  frequency = frequency += input[i % input.length]
	  	  return frequency unless frequencies[frequency].nil?
	  	  frequencies[frequency] = frequency
	  	  i += 1
	  	end
	  end
	end
end
