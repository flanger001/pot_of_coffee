module PotOfCoffee
  module Units
    class Metric
      def name
        'gram'
      end

      def abbreviation
        'g'
      end

      def table
        {
          weak: 2,
          normal: 4.16,
          strong: 5.3
        }
      end
    end
  end
end