class CgtraderLevels::Bonus < ActiveRecord::Base
  self.table_name = 'bonuses'
  
  belongs_to :level
end
