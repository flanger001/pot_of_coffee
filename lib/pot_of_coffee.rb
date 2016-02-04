require 'pot_of_coffee/version'
require 'pot_of_coffee/units'
require 'forwardable'

module PotOfCoffee
  class Error < StandardError; end;
  class NegativeNumberError < Error; end
  class WrongStrengthError < Error; end

  class Brewer
    extend Forwardable
    attr_reader :strength, :quantity, :units

    def_delegator :@units, :table, :ratios

    def initialize(quantity = 12, strength = :normal, units = ImperialUnit.new)

      if quantity < 0
        raise NegativeNumberError, 'Quantity must be greater than 0'
      end

      unless ratios.include?(strength.to_sym)
        raise WrongStrengthError, 'Strength must be strong, normal, or weak'
      end

      @quantity = quantity
      @strength = strength
      @units = units
    end

    def amount
      (quantity * ratios.fetch(strength)).round(2)
    rescue KeyError
      puts "I don't know how to make '#{strength}' strength coffee, sorry. Available options are #{ratios.keys.join(', ')}"
      exit
    end

    def instructions
      "To make #{quantity} cups of of #{strength} coffee, use #{amount} #{units.abbreviation} of grounds."
    end
  end
end