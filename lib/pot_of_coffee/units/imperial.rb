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
          weak: 0.5,
          normal: 0.675,
          strong: 0.875,
        }
      end
    end
  end
end
