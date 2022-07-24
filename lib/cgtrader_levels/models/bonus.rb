# frozen_string_literal: true

module CgtraderLevels
  class Bonus < ActiveRecord::Base
    belongs_to :level

    FIELDS = %w[
      coins
      tax
    ]

    validates :modifier, :field, presence: true
    validates :field, inclusion: { in: FIELDS }

    def apply(levelable)
      levelable.send("#{field}=", levelable.send(field) + modifier)
    end
  end
end
