i = 0

File.foreach( 'numbers.txt' ) do |x|
  i += x.to_i
end

p i
