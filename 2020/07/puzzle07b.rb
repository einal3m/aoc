# frozen_string_literal: true

class Puzzle06b
  class << self
    def call(input)
      parse_groups(input).sum
    end

    def parse_groups(input)
      groups = []
      current_group = []
      current_group_count = 0
      input.each do |line|
        if line.strip == ''
          groups << everyone_answered_count(current_group, current_group_count)
          current_group = []
          current_group_count = 0
          next
        end

        current_group += line.chars
        current_group_count += 1
      end
      groups << everyone_answered_count(current_group, current_group_count)
    end

    def everyone_answered_count(group, count)
      questions = group.group_by { |i| i }
      questions.values.select{|answers| answers.length == count}.flatten.uniq.count
    end
  end
end
