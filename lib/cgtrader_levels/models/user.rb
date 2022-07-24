# frozen_string_literal: true

require 'cgtrader_levels/models/concerns/levelable'

module CgtraderLevels
  class User < ActiveRecord::Base
    include CgtraderLevels::Levelable

    belongs_to :level

    validates :username, uniqueness: true
    validates :coins, :tax, :reputation, :username, presence: true
    validates :coins, :tax, :reputation, comparison: { greater_than_or_equal_to: 0 }
  end
end
