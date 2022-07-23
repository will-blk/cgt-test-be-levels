class CgtraderLevels::Bonus < ActiveRecord::Base
  belongs_to :level

  def apply(levelable)
    levelable.send("#{field}=", levelable.send(field) + modifier)
  end
end
