require 'helper'
require 'whatever_unit'

class TestUnits < Minitest::Test
  def test_can_use_metric_units
    @pot_of_coffee = PotOfCoffee::Brewer.new(units: PotOfCoffee::MetricUnit.new)
    assert_equal @pot_of_coffee.instructions, 'To make 12 cups of of normal coffee, use 63.6 g of grounds.'
  end

  def test_can_provide_your_own_units
    @pot_of_coffee = PotOfCoffee::Brewer.new(units: WhateverUnit.new)
    assert_equal @pot_of_coffee.instructions, 'To make 12 cups of of normal coffee, use 3349.2 gb of grounds.'
  end

  def test_units_must_respond_to_correct_things
    @whatever_unit = WhateverUnit.new
    assert_respond_to @whatever_unit, :name
    assert_respond_to @whatever_unit, :abbreviation
    assert_respond_to @whatever_unit, :table
  end
end