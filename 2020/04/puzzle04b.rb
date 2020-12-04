# frozen_string_literal: true

require_relative 'puzzle04a'

class Puzzle04b
  class << self
    def call(input)
      passports = Puzzle04a.parse_passports(input)
      passports.count { |p| valid?(p) }
    end

    def valid?(passport)
      return false unless year_valid?(year: passport['byr'], min: 1920, max: 2002)
      return false unless year_valid?(year: passport['iyr'], min: 2010, max: 2020)
      return false unless year_valid?(year: passport['eyr'], min: 2020, max: 2030)
      return false unless height_valid?(height: passport['hgt'])
      return false unless hair_colour_valid?(colour: passport['hcl'])
      return false unless eye_colour_valid?(colour: passport['ecl'])
      return false unless passport_id_valid?(id: passport['pid'])

      true
    end

    # byr (Birth Year) - four digits; at least 1920 and at most 2002.
    # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
    # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
    def year_valid?(year:, min:, max:)
      return false unless year

      year.to_i >= min && year.to_i <= max
    end

    # hgt (Height) - a number followed by either cm or in:
    #   If cm, the number must be at least 150 and at most 193.
    #   If in, the number must be at least 59 and at most 76.
    def height_valid?(height:)
      return false unless height

      case height
      when /(\d+)cm/
        argument = Regexp.last_match(1)
        argument.to_i >= 150 && argument.to_i <= 193
      when /(\d+)in/
        argument = Regexp.last_match(1)
        argument.to_i >= 59 && argument.to_i <= 76
      else
        false
      end
    end

    # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
    def hair_colour_valid?(colour:)
      return false unless colour

      colour.match?(/^\#([0-9]|[a-f]){6}$/)
    end

    # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
    def eye_colour_valid?(colour:)
      return false unless colour

      %w[amb blu brn gry grn hzl oth].include?(colour)
    end

    def passport_id_valid?(id:)
      return false unless id

      id.match?(/^[0-9]{9}$/)
    end
  end
end
