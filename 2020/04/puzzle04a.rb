# frozen_string_literal: true

class Puzzle04a
  class << self
    def call(input)
      passports = parse_passports(input)
      passports.count { |p| (p.keys - ['cid']).length == 7 }
    end

    def parse_passports(input)
      passports = []
      current_passport = {}
      input.each do |line|
        if line.strip == ''
          passports << current_passport
          current_passport = {}
          next
        end

        fields = line.split(' ')
        fields.each do |field|
          (key, value) = field.split(':')
          current_passport[key] = value
        end
      end
      passports << current_passport
    end
  end
end
