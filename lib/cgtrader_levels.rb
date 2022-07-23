# frozen_string_literal: true

require 'cgtrader_levels/version'
require 'cgtrader_levels/config/initializers/inflections'

module CgtraderLevels
  autoload :User, 'cgtrader_levels/models/user'
  autoload :Level, 'cgtrader_levels/models/level'
  autoload :Bonus, 'cgtrader_levels/models/bonus'
end
