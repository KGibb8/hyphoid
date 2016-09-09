
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

  it "should not contain more than one mycelium" do
    @b4.update(mycelium: @mycelium2)
    expect(@b4.errors.messages.keys).to include(:mycelium)
    expect(@b4.errors.messages[:mycelium]).equal?(["A location cannot contain more than one mycelium"])
  end

  after do
    ActiveRecord::Base.connection.close
  end

end
