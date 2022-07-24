# frozen_string_literal: true

require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:',
  verbosity: 'quiet'
)

ActiveRecord::Base.connection.create_table :users do |table|
  table.string :username
  table.integer :reputation, default: 0
  table.decimal :coins, default: 0
  table.decimal :tax, default: 30
  table.references :level
end

ActiveRecord::Base.connection.create_table :bonuses do |table|
  table.string :field
  table.integer :modifier
  table.references :level
end

ActiveRecord::Base.connection.create_table :levels do |table|
  table.string :title
  table.integer :experience
  table.references :level 
end
