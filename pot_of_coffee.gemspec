# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pot_of_coffee/version'

Gem::Specification.new do |spec|
  spec.name          = 'pot_of_coffee'
  spec.version       = PotOfCoffee::VERSION
  spec.authors       = ['Dave Shaffer']
  spec.email         = ['dave.shaffer@gmail.com']
  spec.summary       = 'Coffee brew strength calculator'
  spec.description   = 'This is a small CLI app for calculating the brew strength for an automatic drip coffee maker. It can help keep coffee brews consistent.'
  spec.homepage      = 'http://daveshaffer.co/coffee'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['pot_of_coffee']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6.0'
end
