require 'pot_of_coffee/version'
require 'pot_of_coffee/units'
require 'pot_of_coffee/errors'
require 'forwardable'

module PotOfCoffee
  class Brewer
    extend Forwardable
    attr_reader :units

    def_delegator :@units, :table, :ratios

    def initialize(args = {})
      @quantity = args[:quantity] || 12
      @strength = args[:strength] || :normal
      @units = args[:units] || ImperialUnit.new
    end

    def quantity
      if @quantity > 0
        @quantity
      else
        raise NegativeNumberError
      end
    end

    def strength
      if ratios.include?(@strength.to_sym)
        @strength
      else
        raise WrongStrengthError
      end
    end

    def amount
      (quantity * ratios.fetch(strength)).round(2)
    end

    def instructions
      "To make #{quantity} cups of of #{strength} coffee, use #{amount} #{units.abbreviation} of grounds."
    rescue NegativeNumberError, WrongStrengthError => e
      print e.message
    end
  end
end