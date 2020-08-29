# frozen_string_literal: true

module PotOfCoffee
  class CoffeeError < StandardError
  end

  class NegativeNumberError < CoffeeError
    def message
      'Sorry: coffee quantity must be greater than 0'
    end
  end

  class WrongStrengthError < CoffeeError
    def message
      'Sorry: coffee strength must be strong, medium, or mild'
    end
  end
end
