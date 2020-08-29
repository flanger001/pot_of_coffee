# frozen_string_literal: true

module PotOfCoffee
  module Units
    class Imperial
      def name
        'tablespoon'
      end

      def abbreviation
        'tbsp'
      end

      def table
        {
          mild: 0.5,
          medium: 0.675,
          strong: 0.875,
        }
      end
    end
  end
end
