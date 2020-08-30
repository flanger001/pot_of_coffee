# PotOfCoffee

This is a command line coffee brew calculator.
Enter the number of cups you want and the strength.
It can also be used in your own code, and you can supply your own units for grounds if you don't want to use tablespoons.
I use it to maintain intra-office harmony.
Imperial and metric units are provided.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "pot_of_coffee"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pot_of_coffee

## Usage

### CLI

```bash
$ pot_of_coffee
Cups desired: 12
Brew strength: medium
Grounds needed: 8.1 tbsp

$ pot_of_coffee --strength=strong
Cups desired: 12
Brew strength: strong
Grounds needed: 10.5 tbsp

$ pot_of_coffee --strength=blagg
Sorry: coffee strength must be strong, medium, or mild

$ pot_of_coffee --units=metric
Cups desired: 12
Brew strength: medium
Grounds needed: 63.6 g

```

### Ruby

```ruby
require "pot_of_coffee"

pot_of_coffee = PotOfCoffee::Brewer.new(quantity: 12, strength: "mild")
pot_of_coffee.amount # 6.0
pot_of_coffee.instructions
#=> Cups desired: 12
#=> Brew strength: mild
#=> Grounds needed: 6.0 tbsp


# Metric units

pot_of_coffee = PotOfCoffee::Brewer.new(units: PotOfCoffee::Units::Metric)
pot_of_coffee.amount # 63.6
pot_of_coffee.instructions
#=> Cups desired: 12
#=> Brew strength: medium
#=> Grounds needed: 63.6 g
```

## Using your own units
You can use a different set of units or different ratios if you want.
Just supply an object that responds to `name`, `abbreviation`, and `table`.
`name` and `abbreviation` must be strings.
`name` is not used at the moment, but it may be in the future.
`table` must be a hash.
I chose to provide three keys: `:strong`, `:medium`, and `:mild`, but you can use whatever you'd like.

### Example

```ruby
require "pot_of_coffee"

class CorgeUnit
  def name
    "corge"
  end

  def abbreviation
    "cg"
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

The same example can be accomplished easily by making new instance of `PotOfCoffee::Units::Unit`:

```ruby
corge = PotOfCoffee::Units::Unit.new("corge", "cg", { strong: 3900, medium: 200, mild: 100 })
pot_of_coffee = PotOfCoffee::Brewer.new(quantity: 3, strength: :mild, units: corge)
pot_of_coffee.amount # 300
```


## Tests

* Fork/clone the repo
* `bundle install`
* `bundle exec rspec`
* `bundle exec rubocop`

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pot_of_coffee/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
