# frozen_string_literal: true

module CgtraderLevels
  class Level < ActiveRecord::Base
    has_many :users
    has_many :bonuses

    validates :experience, :title, presence: true
  end
end
