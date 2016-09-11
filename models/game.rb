
require './models/game_session'
require './models/location'

class Game < ActiveRecord::Base
  has_many :game_sessions

  attr_accessor :grid

  def initialize_grid(grid_size)
    x_grid = (1..self.grid_size).to_a
    y_grid = (1..self.grid_size).to_a
    grid = Array.new
    x_grid.each do |x|
      axis = Array.new
      y_grid.each do |y|
        axis << Location.create(x_position: x, y_position: y)
      end
      grid << axis
    end
    self.grid = grid
  end

end
