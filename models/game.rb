require './models/location'
require './models/player_session'
require './models/game'

class Game < ActiveRecord::Base
  has_many :player_sessions
  has_many :locations
  has_many :players, through: :player_sessions

  attr_accessor :grid

  def initialize_grid
    x_grid = (1..self.grid_size).to_a
    y_grid = (1..self.grid_size).to_a
    @grid = Array.new
    x_grid.each do |x|
      axis = Array.new
      y_grid.each do |y|
        axis << self.locations.create(x_position: x, y_position: y)
      end
      @grid << axis
    end
    @grid
  end

end


# # Locations in a 5x5 grid
# x_grid = "A B C D E".split
# y_grid = "1 2 3 4 5".split
#
# x_grid.each do |x|
#   y_grid.each do |y|
#     instance_variable_set("@#{x.downcase}#{y}", Location.create(x_position: x, y_position: y))
#   end
# end
