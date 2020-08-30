# frozen_string_literal: true

module PotOfCoffee
  module Errors
    class Error < StandardError
    end

    class NegativeNumber < Error
      def message
        "Sorry: coffee quantity must be greater than 0"
      end
    end

    class WrongStrength < Error
      def message
        "Sorry: coffee strength must be strong, medium, or mild"
      end
    end
  end
end
