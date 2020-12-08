# frozen_string_literal: true

class Puzzle06a
  class << self
    def call(input)
      parse_groups(input).sum
    end

    def parse_groups(input)
      groups = []
      current_group = []
      input.each do |line|
        if line.strip == ''
          groups << current_group.uniq.count
          current_group = []
          next
        end

        current_group += line.chars
      end
      groups << current_group.uniq.count
    end
  end
end
