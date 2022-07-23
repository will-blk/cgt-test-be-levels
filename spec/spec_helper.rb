require 'rubygems'
require 'bundler/setup'

require 'support/init_database'
require 'support/database_cleaner'

require 'simplecov'
SimpleCov.start

require 'byebug'
require 'cgtrader_levels'
require 'support/factory_bot'