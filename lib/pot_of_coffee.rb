require 'pot_of_coffee/version'

module PotOfCoffee
  class Brewer
    # Magic numbers omg
    RATIOS = {
      weak: 0.5,
      normal: 0.675,
      extra: 0.875,
      turbo: 1,
      starbucks: 2, # This is really how strong Starbucks expects someone to brew their coffe
      wtf: 3.8
    }

    attr_reader :ratios, :strength, :quantity

    def initialize(quantity: 12, strength: :normal)
      @quantity = quantity.to_i
      @strength = strength.to_sym
      @scoops = scoops
    end

    def ratios
      @ratios = RATIOS
    end

    def self.ratios
      RATIOS
    end

    def scoops
      (quantity * ratios.fetch(strength)).round(2)
    rescue KeyError
      "I don't know how to make '#{strength}' strength coffee, sorry. Available options are #{ratios.keys.join(', ')}"
    end

  end
end
