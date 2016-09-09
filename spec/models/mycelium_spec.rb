
require 'standalone_migrations'
require './models/player'
require './spec/seed_data_helper'
require 'rspec'
require 'pry'

ActiveRecord::Base.establish_connection YAML.load_file('config/database.yml')["test"]

describe Mycelium do

  before do
    extend SeedData
  end

  it "should occupy a location" do
    expect(@mycelium1.location).to be(@b4)
  end

  it "should not be able to occupy more than one location" do
    @b1.update(mycelium: @mycelium1)
    expect(@mycelium1.errors.messages.keys).to include(:location)
    expect(@mycelium1.errors.messages[:location]).equal?(["A Mycelium cannot occupy more than one location"])
  end

context "Building Hypha (resource miners)"
  it "should be able to create hypha" do
    expect(@mycelium1.hypha.count).to eq(0)
    @mycelium1.build_hyphae
    expect(@mycelium1.hypha.count).to eq(1)
    expect(@mycelium.carbon).to eq(80)
  end

  it "should receive resources from hyphae and add them to it's resource stock" do

  end

  after do
    ActiveRecord::Base.connection.close
  end

end
