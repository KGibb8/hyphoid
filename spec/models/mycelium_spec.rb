require './spec/spec_helper'

describe Mycelium do

  before do
    extend SeedData
  end

  context "on creation of any one mycelium" do
    it "should occupy a location" do
      expect(@mycelium1.location).to eq(@game1.grid[1][3])
    end

    it "should not be able to occupy more than one location" do
      @game1.grid[1][0].update(mycelium: @mycelium1)
      expect(@mycelium1.errors.messages.keys).to include(:location)
      expect(@mycelium1.errors.messages[:location]).equal?(["A Mycelium cannot occupy more than one location"])
    end

    it "should be able to view its neighbours" do
      expect(@mycelium1.find_neighbours).to include(@mycelium2)
    end
  end

  context "creation of child" do
    it "should know who its children are" do
      expect(@mycelium1.children).to include(@mycelium3)
    end

    it "should know who its mother is" do
      expect(@mycelium3.mother).to eq(@mycelium1)
    end

    it "should know the location of its child/mother on the grid" do
      expect(@mycelium3.mother.location).to eq(@game1.grid[1][3])
      expect(@mycelium1.children.first.location).to eq(@game1.grid[0][1])
    end

  end

  context "Building Hyphae (resource miners)" do
    it "should be able to create hypha" do
      expect(@mycelium1.hyphae.count).to eq(1)
    end

    it "should cost proteins to build a hypha" do
      expect(@mycelium1.proteins).to eq(90)
    end

    it "should receive resources from hyphae and add them to it's resource stock" do
      @mycelium1.build_hypha
      @mycelium1.build_hypha
      @mycelium1.build_hypha
      @mycelium1.build_hypha
      @mycelium1.mine
      expect(@mycelium1.resources).to eq({carbon: 125, sugars: 50, proteins: 75, nitrates: 125})
    end
  end




end
