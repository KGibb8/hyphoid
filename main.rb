
require 'standalone_migrations'
require 'pry'

Dir[File.expand_path("../models/*.rb", __dir__)].each { |file| require file }

ActiveRecord::Base.establish_connection YAML.load_file('config/database.yml')[ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "development"]


ActiveRecord::Base.connection.close
