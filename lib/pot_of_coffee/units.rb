# frozen_string_literal: true

module PotOfCoffee
  module Units
    Unit = Struct.new(:name, :abbreviation, :table)

    Imperial = Unit.new("tablespoon", "tbsp", { mild: 0.5, medium: 0.675, strong: 0.875 })
    Metric = Unit.new("gram", "g", { mild: 2, medium: 4.16, strong: 5.3 })
  end
end
