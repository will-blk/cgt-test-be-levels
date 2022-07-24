# frozen_string_literal: true

module CgtraderLevels
  module Levelable
    extend ActiveSupport::Concern

    included do
      after_initialize :set_initial_level, unless: :persisted?

      before_update :check_next_level, if: :reputation_changed?
      before_update :apply_new_level_bonus, if: :level_changed?
    end

    private

    def apply_new_level_bonus
      level.bonuses.each do |bonus|
        bonus.apply(self)
      end
    end

    def set_initial_level
      self.level = CgtraderLevels::Level.find_by(experience: 0)
    end

    def check_next_level
      next_level = CgtraderLevels::Level.find_by(level:)
      self.level = next_level if reputation >= next_level.experience
    end
  end
end
