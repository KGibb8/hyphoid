require './spec/spec_helper'

describe Game do

  before do
    extend SeedData
  end

  it "should be able to see all participating players" do
    expect(@game1.players.map(&:name)).to eq(["Mycophile", "Dendrophile"])
    expect(@game1.players.count).to eq(2)
    expect(@game2.players.count).to eq(4)
  end

  it "should be able to generate the grid_map for the game" do
    expect(@game1.grid.count).to eq(5)
    expect(@game2.grid.count).to eq(10)
  end

  it "should expand the size of the grid relative to the number of participating players" do

  end


end
