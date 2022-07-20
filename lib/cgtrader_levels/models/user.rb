class CgtraderLevels::User < ActiveRecord::Base
  attr_reader :level

  after_initialize do
    matching_level = CgtraderLevels::Level.find_by(experience: reputation)

    if matching_level
      self.level_id = matching_level.id
      @level = matching_level
    end
  end

  after_update :set_new_level

  private

  def set_new_level
    matching_level = CgtraderLevels::Level.where('experience <= ?', reputation).order(experience: :desc).first

    if matching_level
      self.level_id = matching_level.id
      @level = matching_level
    end
  end
end
