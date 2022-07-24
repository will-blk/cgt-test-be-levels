# frozen_string_literal: true

module CgtraderLevels
  class Bonus < ActiveRecord::Base
    belongs_to :level, optional: false

    FIELDS = %w[
      coins
      tax
    ].freeze

    validates :modifier, :field, presence: true
    validates :field, inclusion: { in: FIELDS }

    def apply(levelable)
      levelable.send("#{field}=", levelable.send(field) + modifier)
    end
  end
end
