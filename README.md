# PotOfCoffee

This is a command line coffee brew calculator. Enter the number of cups you want and the strength. I use it to maintain intra-office harmony.

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
pot_of_coffee 12 normal # "Number of scoops needed: 8.1"
pot_of_coffee 12 blagg  # "I don't know how to make 'blagg' strength coffee, sorry. Available options are weak, normal, extra, turbo, starbucks, wtf"
```

### Rails
```ruby
pot_of_coffee = PotOfCoffee::Brewer.new(quantity: 12, strength: 'weak')
pot_of_coffee.scoops # 6.0
```

## Tests

Clone the repo and run `rake test`. The test coverage is *very basic*.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pot_of_coffee/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
