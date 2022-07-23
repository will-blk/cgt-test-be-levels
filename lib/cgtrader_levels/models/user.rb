class CgtraderLevels::User < ActiveRecord::Base
  belongs_to :level

  after_initialize :set_level, unless: :persisted?

  before_update :set_level, if: :reputation_changed?

  private

  def set_level
    matching_level = CgtraderLevels::Level.where('experience <= ?', reputation).order(experience: :desc).first

    if matching_level
      self.level = matching_level
    end
  end
end
