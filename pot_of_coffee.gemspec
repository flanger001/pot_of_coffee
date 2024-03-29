# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pot_of_coffee/version"

Gem::Specification.new do |spec|
  spec.name          = "pot_of_coffee"
  spec.version       = PotOfCoffee::VERSION
  spec.authors       = ["Dave Shaffer"]
  spec.email         = ["dave.shaffer@gmail.com"]
  spec.summary       = "Coffee brew strength calculator"
  spec.description   = "This is a small CLI app for calculating the brew strength for an automatic drip coffee maker. It can help keep coffee brews consistent."
  spec.homepage      = "https://github.com/flanger001/pot_of_coffee"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.7.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["pot_of_coffee"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "rubocop"
end
