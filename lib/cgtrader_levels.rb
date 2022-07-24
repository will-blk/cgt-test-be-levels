# frozen_string_literal: true

require 'cgtrader_levels/version'
require 'cgtrader_levels/config/initializers/inflections'

module CgtraderLevels
  module Models
    module Concerns
      autoload :Levelable, 'cgtrader_levels/models/concerns/levelable'
    end

    autoload :User, 'cgtrader_levels/models/user'
    autoload :Level, 'cgtrader_levels/models/level'
    autoload :Bonus, 'cgtrader_levels/models/bonus'
  end
end
