
require 'standalone_migrations'
require './models/player'
require './spec/seed_data_helper'
require 'rspec'
require 'pry'

ActiveRecord::Base.establish_connection YAML.load_file('config/database.yml')["test"]

describe Location do

  before do
    extend SeedData
  end

  it "should not occur more than once in all mycelia" do

  end


  after do
    ActiveRecord::Base.connection.close
  end

end
