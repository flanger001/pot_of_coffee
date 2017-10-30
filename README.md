# PotOfCoffee

This is a command line coffee brew calculator.
Enter the number of cups you want and the strength.
It can also be used in your own code, and you can supply your own units for grounds if you don't want to use tablespoons.
I use it to maintain intra-office harmony.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pot_of_coffee'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pot_of_coffee

## Usage

### CLI
```ruby
pot_of_coffee # "To make 12 cups of medium coffee, use 8.1 tbsp of grounds."
pot_of_coffee --strength strong # "To make 12 cups of strong coffee, use 10.5 tbsp of grounds."
pot_of_coffee --quantity 11 --strength blagg  # "Sorry: coffee strength must be strong, medium, or mild"
pot_of_coffee --units metric #To make 12 cups of coffee, use 63.6 g of grounds."
```

### Ruby
```ruby
require 'pot_of_coffee'

pot_of_coffee = PotOfCoffee::Brewer.new(quantity: 12, strength: 'mild')
pot_of_coffee.amount # 6.0
pot_of_coffee.instructions # 'To make 12 cups of medium coffee, use 6.0 tbsp of grounds.'

# Metric units

pot_of_coffee = PotOfCoffee::Brewer.new(units: PotOfCoffee::Units::Metric.new)
pot_of_coffee.amount # 63.6
pot_of_coffee.instructions # 'To make 12 cups of medium coffee, use 63.6 g of grounds.'
```

## Using your own units
If you want to use a different set of units or different ratios, you can do so quite simply.
Just supply an object that responds to `name`, `abbreviation`, and `table`.
`name` and `abbreviation` must be strings.
`name` is not used at the moment, but it may be in the future.
`table` must be a hash.
I chose to provide three keys: `:strong`, `:medium`, and `:mild`, but you can use whatever you'd like.

### Example
```ruby
require 'pot_of_coffee'

class CorgeUnit
  def name
    'corge'
  end

  def abbreviation
    'cg'
  end

  def table
    {
      strong: 3900,
      medium: 200,
      mild: 100
    }
  end
end

pot_of_coffee = PotOfCoffee::Brewer.new(quantity: 3, strength: :mild, units: CorgeUnit.new)
pot_of_coffee.amount # 300
```

## Tests

Clone the repo and run `rake test`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pot_of_coffee/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
