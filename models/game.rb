
require './models/game_session'
require './models/location'

class Game < ActiveRecord::Base
  has_many :game_sessions

  def initialize_grid(grid_size)
    x_grid = (1..grid_size).to_a
    y_grid = (1..grid_size).to_a
    grid = Array.new
    x_grid.each do |x|
      axis = Array.new
      y_grid.each do |y|
        axis << Location.create(x_position: x, y_position: y)
      end
      grid << axis
    end
    grid
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
