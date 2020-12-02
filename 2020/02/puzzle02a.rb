class Puzzle02a
  class << self
    def call(input)
      password_matches = input.map do |line|
        split = line.split(/-|:|\s/)
        min = split[0].to_i
        max = split[1].to_i
        char = split[2]
        password = split[4]

        count = password.count(char)
        (count >= min) && (count <= max)
      end

      password_matches.count { |m| m }
    end
  end
end
