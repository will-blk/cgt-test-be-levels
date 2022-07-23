# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    ActiveRecord::Base.connection.tap do |connection|
      %w[users levels].each { |table| connection.execute("DELETE FROM #{table}") }
    end
  end
end
