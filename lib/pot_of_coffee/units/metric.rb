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
          mild: 2,
          medium: 4.16,
          strong: 5.3
        }
      end
    end
  end
end