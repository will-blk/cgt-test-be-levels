# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cgtrader_levels/version'

Gem::Specification.new do |spec|
  spec.name          = 'cgtrader_levels'
  spec.version       = CgtraderLevels::VERSION
  spec.authors       = ['Vilius Luneckas', 'Willian Blanck']
  spec.email         = ['vilius.luneckas@gmail.com', 'will-blk@hotmail.com']
  spec.summary       = 'CGTrader test ground'
  spec.description   = 'The goal of this gem is to test the ability to test,
                        refact and implement new functionality on a given system.'
  spec.homepage      = 'https://github.com/CGTrader/cgt-test-be-levels'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.1'

  spec.add_dependency 'activerecord'
  spec.add_dependency 'sqlite3'
  spec.add_development_dependency 'bundler', '~> 2.3'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '>= 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
