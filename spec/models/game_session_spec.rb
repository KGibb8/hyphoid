require './spec/spec_helper'

describe GameSession do

  before do
    extend SeedData
  end

  it "should be able to see all participating players" do
    expect(@game.players.count).to eq(2)
  end

  it "should be able to generate the grid_map for the game" do
    @game.game.initialize_grid(5)
    expect(@game.grid.count).to eq(5)
  end


end
