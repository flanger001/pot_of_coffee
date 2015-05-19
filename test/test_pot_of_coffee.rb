require 'minitest/autorun' # Because testing should happen
require 'minitest/pride' # Because testing should be fabulous
require 'pot_of_coffee'

class PotOfCoffeeTest < Minitest::Test
  def setup
    options = { quantity: rand(24), strength: PotOfCoffee::Brewer.ratios.keys.sample }
    @pot_of_coffee = PotOfCoffee::Brewer.new(options)
  end

  def test_ratios
    assert_kind_of Hash, PotOfCoffee::Brewer.ratios
  end

  def test_strength
    assert_includes @pot_of_coffee.ratios, @pot_of_coffee.strength
  end

  def test_quantity
    assert_kind_of Integer, @pot_of_coffee.quantity
  end

  def test_scoops
    assert_kind_of Float, @pot_of_coffee.scoops
  end
end