require './spec/spec_helper'

describe Game do

  before do
    binding.pry
    @game = Game.create(grid_size: 5)
    @player1 = Player.create(name: "Fat Tony")
    @palyer2 = Player.create(name: "Homer Simpson")
  end

  it "should be able to see all participating players" do
    binding.pry
    expect(@game.players.count).to eq(2)
  end

  it "should be able to generate the grid_map for the game" do
    @game.initialize_grid
    expect(@game.grid.count).to eq(5)
  end


end
