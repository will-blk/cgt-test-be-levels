# frozen_string_literal: true

require 'cgtrader_levels/models/concerns/levelable'

module CgtraderLevels
  class User < ActiveRecord::Base
    include CgtraderLevels::Levelable

    belongs_to :level
  end
end
