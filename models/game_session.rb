require './models/location'

class GameSession < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  has_many :locations

  # def grid
  #   self.grid = self.game.initialize_grid(grid_size, grid_size)
  # end

end
