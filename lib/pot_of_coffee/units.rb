module PotOfCoffee
  class Unit
    def name; raise NotImplementedError; end
    def abbreviation; raise NotImplementedError; end
    def table; raise NotImplementedError; end
  end

  class ImperialUnit < Unit
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

  class MetricUnit < Unit
    def name
      'gram'
    end

    def abbreviation
      'g'
    end

    def table
      {
        weak: 12,
        normal: 20,
        strong: 28,
      }
    end
  end
end