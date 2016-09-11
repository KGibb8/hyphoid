require './spec/spec_helper'

describe Mycelium do

  before do
    extend SeedData
  end

  context "on creation of any one mycelium" do
    it "should occupy a location" do
      expect(@mycelium1.location).to eq(@game.grid[1][3])
    end

    it "should not be able to occupy more than one location" do
      binding.pry
      @game.grid[1][0].update(mycelium: @mycelium1)
      binding.pry
      expect(@mycelium1.errors.messages.keys).to include(:location)
      expect(@mycelium1.errors.messages[:location]).equal?(["A Mycelium cannot occupy more than one location"])
    end
  end

  context "creation of child" do
    it "should know who its children are" do
      @mycelium1.reload
      expect(@mycelium1.children.first).to eq(@mycelium3)
    end

    it "should know who its mother is" do
      expect(@mycelium3.mother).to eq(@mycelium1)
    end

    it "should know the location of it's child/mother on the grid" do
      binding.pry
      # TODO: THIS IS VERY STRANGE
      expect(@mycelium3.mother.location).to eq(@b4)
      expect(@mycelium1.children.first.location).to eq(@a2)
    end

  end

  context "Building Hypha (resource miners)" do
    it "should be able to create hypha" do
      expect(@mycelium1.hypha.count).to eq(0)
      @mycelium1.build_hyphae
      expect(@mycelium1.hypha.count).to eq(1)
    end

    it "should cost proteins to build a hyphae" do
      @mycelium1.build_hyphae
      expect(@mycelium1.proteins).to eq(90)
    end

    it "should receive resources from hyphae and add them to it's resource stock" do
      # TODO: As it stands we're not entirely sure what the purpose of the hypha
      # is as we aren't yet sure how they interact with their environment
    end
  end

  it "should be able to view it's neighbours" do
    expect(@mycelium1.display_neighbours).to include(@mycelium2)
  end


end
