
class Puzzle03b
	class << self
	  def do_it(input)
	  	(grid, ids) = initialize(input)

	  	input.each do |line|
	  		(id, left, top, width, height) = parse_line(line)
			(top..top+height-1).each do |y|
				(left..left+width-1).each do |x|
					if grid[y][x]
						grid[y][x] = grid[y][x] << id
						ids = ids - grid[y][x]
					else
						grid[y][x] = [id]
					end
				end
			end	  		
		end

		"##{ids.first}"
	  end

	  private

	  def parse_line(line)
	  	line.match(/#(\d+)\s@\s(\d+),(\d+):\s(\d+)x(\d+)/).captures.map(&:to_i)
	  end

	  def initialize(input)
	  	total_width = 0
	  	total_height = 0
	  	ids = []

	  	input.each do |line|
	  		(id, left, top, width, height) = parse_line(line)
	  		ids << id
	  		total_width = [total_width, left + width].max
	  		total_height = [total_height, top + height].max
	  	end

	  	[Array.new(total_height){ Array.new(total_width) }, ids]
	  end
	end
end
