module CgtraderLevels::Levelable
  extend ActiveSupport::Concern

  included do
    after_initialize :set_level, unless: :persisted?

    before_update :set_level, if: :reputation_changed?
    before_update :apply_new_level_bonus, if: :level_changed?
  end

  private

  def apply_new_level_bonus
    level.bonuses.each do |bonus|
      bonus.apply(self)
    end
  end

  def set_level
    self.level = CgtraderLevels::Level.where('experience <= ?', reputation).order(experience: :desc).first
  end
end