
require './models/player'
require './models/location'
require './models/hyphae'
require './models/mushroom'
require './models/spore'
require 'pry'
# require './models/request'


class Mycelium < ActiveRecord::Base
  belongs_to :player
  belongs_to :mother, class_name: "Mycelium", foreign_key: :mother_id, inverse_of: :children
  has_many :children, class_name: "Mycelium", foreign_key: :mother_id, inverse_of: :mother
  has_one :location
  has_many :hypha
  has_many :mushrooms
  has_many :spores, through: :mushrooms

  validate :singular

  def resources
    {carbon: self.carbon, sugars: self.sugars, proteins: self.proteins, nitrates: self.nitrates}
  end

  def build_hyphae
    self.hypha.create
    self.proteins -= 10
  end

  def display_neighbours
    neighbours = []
    grid = self.location.game_session.grid
    grid.each_with_index do |row, row_count|
      row.each_with_index do |position, position_count|
        if (self.location.x_position && self.location.y_position) == (position.x_position && position.y_position)
          neighbours = [
            grid[row_count - 1][position_count - 1], # Northwest
            grid[row_count][position_count - 1], # West
            grid[row_count + 1][position_count - 1], # Southwest
            grid[row_count + 1][position_count], # South
            grid[row_count + 1][position_count + 1], # Southeast
            grid[row_count][position_count + 1], # East
            grid[row_count - 1][position_count + 1], #Northeast
            grid[row_count - 1][position_count] # North
          ]
          neighbours.reject {|neighbour| neighbour.mycelium.nil? }
        end
      end
    end
    neighbours
  end


  private

  def singular
    unless self.location.nil?
      self.errors.add(:location, "A Mycelium cannot occupy more than one location")
    end
  end

  # TODO: How does fulfilment of a request work?

end
