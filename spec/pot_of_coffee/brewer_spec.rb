RSpec.describe PotOfCoffee::Brewer do
  context 'with no arguments' do
    let(:pot_of_coffee) { PotOfCoffee::Brewer.new }

    it 'has correct properties and gives instructions' do
      expect(pot_of_coffee.instructions).to eq('To make 12 cups of of normal coffee, use 8.1 tbsp of grounds.')
      expect(pot_of_coffee.quantity).to eq(12)
      expect(pot_of_coffee.strength).to eq(:normal)
    end
  end

  context 'with invalid quantity' do
    it 'raises PotOfCoffee::NegativeNumberError' do
      expect { PotOfCoffee::Brewer.new(quantity: -1) }.to raise_error(PotOfCoffee::NegativeNumberError)
    end
  end

  context 'with invalid strength' do
    it 'raises PotOfCoffee::WrongStrengthError' do
      expect { PotOfCoffee::Brewer.new(strength: :ultra) }.to raise_error(PotOfCoffee::WrongStrengthError)
    end
  end


  context 'with own units' do
    class WhateverUnit
      def name
        'grably'
      end

      def abbreviation
        'gb'
      end

      def table
        {
          strong: 109109,
          normal: 279.10,
          weak: 100
        }
      end
    end

    let(:units) { WhateverUnit.new }
    let(:pot_of_coffee) { PotOfCoffee::Brewer.new(units: units) }

    it 'can provide your own units' do
      expect(pot_of_coffee.instructions).to eq('To make 12 cups of of normal coffee, use 3349.2 gb of grounds.')
    end
  end
end
