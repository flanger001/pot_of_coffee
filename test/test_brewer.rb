require 'helper'

class TestBrewer < Minitest::Test
  def test_gives_instructions_with_no_arguments
    @pot_of_coffee = PotOfCoffee::Brewer.new
    assert_equal @pot_of_coffee.instructions, "To make 12 cups of of normal coffee, use 8.1 tbsp of grounds."
  end

  def test_has_correct_properties_when_created_with_no_arguments
    @pot_of_coffee = PotOfCoffee::Brewer.new
    assert_equal @pot_of_coffee.quantity, 12
    assert_equal @pot_of_coffee.strength, :normal
  end

  def test_quantity_must_be_positive
    @pot_of_coffee = PotOfCoffee::Brewer.new(quantity: -1)
    assert_raises PotOfCoffee::NegativeNumberError do
      @pot_of_coffee.quantity
    end
  end

  def test_strength_must_be_strong_normal_or_weak
    @pot_of_coffee = PotOfCoffee::Brewer.new(quantity: rand(24), strength: :ultra)
    assert_raises PotOfCoffee::WrongStrengthError do
      @pot_of_coffee.strength
    end
  end
end
