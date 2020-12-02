class Puzzle02b
  class << self
    def call(input)
      #'1-3 a: abcde'
      password_matches = input.map do |line|
        split = line.split(/-|:|\s/)
        first = split[0].to_i
        second = split[1].to_i
        char = split[2]
        password = split[4]

        one = (password[first-1] == char) && (password[second-1] != char)
        two = (password[second-1] == char) && (password[first-1] != char)

        (one && !two) || (two && !one)
      end

      password_matches.count { |m| m }
    end
  end
end
