ActiveRecord::Migration.verbose = false
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), '../debug.log'))
ActiveRecord::Base.logger.level = ENV['TRAVIS'] ? ::Logger::ERROR : ::Logger::DEBUG

ActiveRecord::Schema.define(:version => 1) do
  create_table :players do |t|
    t.string :first_name
    t.string :last_name
    t.string :position, limit: 2
    t.string :city
    t.string :club

    t.timestamps null: false
  end
end

class Player < ActiveRecord::Base
  extend ActsAsExplorable
  explorable in: [:first_name, :last_name, :position, :city, :club],
             sort: [:first_name, :last_name, :position, :city, :club, :created_at],
             position: ['GK', 'MF', 'FW']
end

class Explorable < ActiveRecord::Base
  self.table_name = :players
  extend ActsAsExplorable
  explorable
end

class NotExplorable < ActiveRecord::Base
  self.table_name = :players
end