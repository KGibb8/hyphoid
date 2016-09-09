
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

  context "on creation of any one mycelium" do
    it "should occupy a location" do
      expect(@mycelium1.location).to eq(@b4)
    end

    it "should not be able to occupy more than one location" do
      @b1.update(mycelium: @mycelium1)
      expect(@mycelium1.errors.messages.keys).to include(:location)
      expect(@mycelium1.errors.messages[:location]).equal?(["A Mycelium cannot occupy more than one location"])
    end
  end

  context "creation of child" do
    it "should know that it has a child" do
      expect(@mycelium1.children.first).to eq(@mycelium3)
    end

    it "should know that it has a mother" do
      expect(@mycelium3.mother).to eq(@mycelium1)
    end

    it "should know the location of it's child/mother on the grid" do
      binding.pry
      expect(@mycelium3.mother.location).to eq(@b4)
      expect(@mycelium1.children.first.location).to eq(@a2)
    end

  end

  # context "Building Hypha (resource miners)" do
  #   it "should be able to create hypha" do
  #     expect(@mycelium1.hypha.count).to eq(0)
  #     @mycelium1.build_hyphae
  #     expect(@mycelium1.hypha.count).to eq(1)
  #     expect(@mycelium.proteins).to eq(90)
  #   end
  #
  #   it "should receive resources from hyphae and add them to it's resource stock" do
  #
  #   end
  # end

  after do
    ActiveRecord::Base.connection.close
  end

end
