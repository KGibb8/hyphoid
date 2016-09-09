require './spec/seed_data_helper'

require 'pry'

ActiveRecord::Base.establish_connection YAML.load_file('config/database.yml')[ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "development"]



ActiveRecord::Base.connection.close
