require 'cgtrader_levels/models/concerns/levelable'

class CgtraderLevels::User < ActiveRecord::Base
  include CgtraderLevels::Levelable

  belongs_to :level
end
