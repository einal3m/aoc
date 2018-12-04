
class Puzzle03a
	class << self
	  def do_it(input)
	  	total_width = 0
	  	total_height = 0
	  	input.each do |line|
	  		(id, left, top, width, height) = parse_line(line)
	  		total_width = [total_width, left + width].max
	  		total_height = [total_height, top + height].max
	  	end

	  	grid = Array.new(total_height){ Array.new(total_width, 0) }

	  	input.each do |line|
	  		(id, left, top, width, height) = parse_line(line)
			(top..top+height-1).each do |y|
				(left..left+width-1).each do |x|
					grid[y][x] = grid[y][x] + 1
				end
			end	  		
		end

		grid.map {|row| row.select { |square| square > 1 }.count }.inject(0, :+)
	  end

	  private

	  def parse_line(line)
	  	line.match(/#(\d+)\s@\s(\d+),(\d+):\s(\d+)x(\d+)/).captures.map(&:to_i)
	  end
	end
end
