
tester = [
  'position=< 9,  1> velocity=< 0,  2>',
  'position=< 7,  0> velocity=<-1,  0>',
  'position=< 3, -2> velocity=<-1,  1>',
  'position=< 6, 10> velocity=<-2, -1>',
  'position=< 2, -4> velocity=< 2,  2>',
  'position=<-6, 10> velocity=< 2, -2>',
  'position=< 1,  8> velocity=< 1, -1>',
  'position=< 1,  7> velocity=< 1,  0>',
  'position=<-3, 11> velocity=< 1, -2>',
  'position=< 7,  6> velocity=<-1, -1>',
  'position=<-2,  3> velocity=< 1,  0>',
  'position=<-4,  3> velocity=< 2,  0>',
  'position=<10, -3> velocity=<-1,  1>',
  'position=< 5, 11> velocity=< 1, -2>',
  'position=< 4,  7> velocity=< 0, -1>',
  'position=< 8, -2> velocity=< 0,  1>',
  'position=<15,  0> velocity=<-2,  0>',
  'position=< 1,  6> velocity=< 1,  0>',
  'position=< 8,  9> velocity=< 0, -1>',
  'position=< 3,  3> velocity=<-1,  1>',
  'position=< 0,  5> velocity=< 0, -1>',
  'position=<-2,  2> velocity=< 2,  0>',
  'position=< 5, -2> velocity=< 1,  2>',
  'position=< 1,  4> velocity=< 2,  1>',
  'position=<-2,  7> velocity=< 2, -2>',
  'position=< 3,  6> velocity=<-1, -1>',
  'position=< 5,  0> velocity=< 1,  0>',
  'position=<-6,  0> velocity=< 2,  0>',
  'position=< 5,  9> velocity=< 1, -2>',
  'position=<14,  7> velocity=<-2,  0>',
  'position=<-3,  6> velocity=< 2, -1>'      
]


input_from_file = File.readlines( 'input.txt' ).map { |x| x }

def do_it(input)
  points = initialize_points(input)

  user_input = 0
  time = 0
  until user_input == 'n' do
    while time < 10616 do
      points = tick_points(points)
      time += 1
    end

    points = tick_points(points)
    print_points(points)

    puts "step: #{time}, continue? (y/n)?" 
    user_input = gets[0]
    time += 1
  end
end

def initialize_points(input)
  input.map do |line|
    (x, y, velocity_x, velocity_y) = line.match(/position=<(.+), (.+)> velocity=<(.+), (.+)>/).captures

    { x: x.to_i, y: y.to_i, velocity_x: velocity_x.to_i, velocity_y: velocity_y.to_i }
  end
end

def print_points(points)
  min_x = points.min_by{|p| p[:x]}[:x]
  max_x = points.max_by{|p| p[:x]}[:x]

  min_y = points.min_by{|p| p[:y]}[:y]
  max_y = points.max_by{|p| p[:y]}[:y]

  (min_y...max_y+1).each do |y|
    (min_x...max_x+1).each do |x|
      found = points.detect{ |point| point[:x] == x && point[:y] == y }
      print found ? '#' : '.'
    end
    puts ''
  end

  p "x range: #{min_x} - #{max_x} (#{max_x - min_x}), y range: #{min_y} - #{max_y} (#{max_y - min_y})"
end

def tick_points(points)
  points.map do |point|
    { 
      x: point[:x] + point[:velocity_x], 
      y: point[:y] + point[:velocity_y], 
      velocity_x: point[:velocity_x], 
      velocity_y: point[:velocity_y] 
    }
  end
end

do_it(input_from_file)

