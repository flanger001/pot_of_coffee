# frozen_string_literal: true

module PotOfCoffee
  class Brewer
    attr_reader :units, :quantity, :strength

    def initialize(quantity: 12, strength: :medium, units: Units::Imperial.new)
      fail NegativeNumberError unless quantity > 0
      fail WrongStrengthError unless units.table.keys.include?(strength)

      @quantity = quantity
      @strength = strength
      @units = units
    end

    def grounds
      (quantity * units.table.fetch(strength)).round(2)
    end

    def instructions
      <<~INSTRUCTIONS
        Cups desired: #{quantity}
        Brew strength: #{strength}
        Grounds needed: #{grounds} #{units.abbreviation}
      INSTRUCTIONS
    end
  end
end
