class CgtraderLevels::Level < ActiveRecord::Base
  has_many :users
  has_many :bonuses
end
