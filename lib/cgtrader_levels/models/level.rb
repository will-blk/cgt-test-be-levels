# frozen_string_literal: true

module CgtraderLevels
  module Models
    class Level < ActiveRecord::Base
      has_many :users
      has_many :bonuses

      belongs_to :level

      validates :experience, :title, presence: true
      validates :experience, comparison: { equal_to: 0, message: 'on first level must be 0' }, unless: :level_id
      validates :experience, comparison: { greater_than: :previous_level_experience }, if: :level_id

      private

      def previous_level_experience
        level.experience
      end
    end
  end
end
