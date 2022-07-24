# frozen_string_literal: true

module CgtraderLevels
  module Models
    module Concerns
      module Levelable
        extend ActiveSupport::Concern

        included do
          after_initialize :set_initial_level, unless: :persisted?

          before_update :level_up, if: :level_up?
        end

        private

        def set_initial_level
          self.level = Level.find_by(experience: 0)
        end

        def level_up
          self.level = next_level

          level.bonuses.each do |bonus|
            bonus.apply(self)
          end
        end

        def level_up?
          return false unless next_level

          reputation >= next_level.experience
        end

        def next_level
          Level.where('experience <= ?', reputation).find_by(level:)
        end
      end
    end
  end
end
