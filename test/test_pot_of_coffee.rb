require 'minitest/autorun' # Because testing should happen
require 'minitest/pride' # Because testing should be fabulous
require 'pot_of_coffee'

class PotOfCoffeeTest < Minitest::Unit

  def gives_instructions_with_no_arguments
    @pot_of_coffee = PotOfCoffee::Brewer.new
    assert_equal @pot_of_coffee.instructions, "To make 12 cups of of normal coffee, use 8.1 tbsp of grounds."
  end

  def test_has_correct_properties_when_created_with_no_arguments
    @pot_of_coffee = PotOfCoffee::Brewer.new
    assert_equal @pot_of_coffee.quantity = 12
    assert_equal @pot_of_coffee.strength = :normal
  end

  def test_quantity_must_be_positive
    @pot_of_coffee = PotOfCoffee::Brewer.new(-1)
    assert_raises PotOfCoffee::NegativeNumberError
  end

  def test_strength_must_be_strong_normal_or_weak
    @pot_of_coffee = PotOfCoffee::Brewer.new(rand(24), :ultra)
    assert_raises PotOfCoffee::WrongStrengthError
  end

  def test_can_provide_your_own_units

  end
end

