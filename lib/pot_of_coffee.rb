require 'pot_of_coffee/version'
require 'pot_of_coffee/units'
require 'pot_of_coffee/errors'

module PotOfCoffee
  class Brewer
    attr_reader :units, :quantity, :strength

    def initialize(quantity: 12, strength: :normal, units: Units::Imperial.new)
      fail NegativeNumberError unless quantity > 0
      fail WrongStrengthError unless units.table.keys.include?(strength)

      @quantity = quantity
      @strength = strength
      @units = units
      # rescue NegativeNumberError, WrongStrengthError => e
      #   print e.message
    end

    def amount
      (quantity * units.table.fetch(strength)).round(2)
    end

    def instructions
      "To make #{quantity} cups of of #{strength} coffee, use #{amount} #{units.abbreviation} of grounds."
    end
  end
end