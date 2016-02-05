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
      'Sorry: coffee strength must be strong, normal, or weak'
    end
  end
end