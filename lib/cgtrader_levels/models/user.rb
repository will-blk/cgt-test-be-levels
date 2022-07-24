# frozen_string_literal: true

module CgtraderLevels
  module Models
    class User < ActiveRecord::Base
      include Concerns::Levelable

      belongs_to :level, optional: false

      validates :username, uniqueness: true
      validates :coins, :tax, :reputation, :username, presence: true
      validates :coins, :tax, :reputation, comparison: { greater_than_or_equal_to: 0 }
    end
  end
end
