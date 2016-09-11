
require './models/player'
require './models/location'
require './models/hypha'
require './models/mushroom'
require './models/spore'
require 'pry'
# require './models/request'


class Mycelium < ActiveRecord::Base
  belongs_to :player
  belongs_to :mother, class_name: "Mycelium", foreign_key: :mother_id, inverse_of: :children
  has_many :children, class_name: "Mycelium", foreign_key: :mother_id, inverse_of: :mother
  has_one :location
  has_many :hyphae
  has_many :mushrooms
  has_many :spores, through: :mushrooms

  # validate :singular

  # def initialize
  #   self.carbon = 100
  #   self.sugars = 100
  #   self.proteins = 100
  #   self.nitrates = 100
  # end

  def resources
    {carbon: self.carbon, sugars: self.sugars, proteins: self.proteins, nitrates: self.nitrates}
  end

  def build_hypha
    self.hyphae.create
    self.proteins -= 10
  end

  def find_neighbours
    neighbours = []
    grid = self.location.game.grid
    grid.each_with_index do |row, row_index|
      row.each_with_index do |position, position_index|
        if (self.location.x_position == position.x_position) && (self.location.y_position == position.y_position)
          neighbours = [
            grid[row_index - 1][position_index - 1], # Northwest
            grid[row_index][position_index - 1], # West
            grid[row_index + 1][position_index - 1], # Southwest
            grid[row_index + 1][position_index], # South
            grid[row_index + 1][position_index + 1], # Southeast
            grid[row_index][position_index + 1], # East
            grid[row_index - 1][position_index + 1], #Northeast
            grid[row_index - 1][position_index] # North
          ]
          neighbours = neighbours.reject {|neighbour| neighbour.mycelium.nil? }
        end
      end
    end
    neighbours.map(&:mycelium)
  end

  private

  def singular
    unless Location.find_by(mycelium: self).nil?
      self.errors.add(:location, "A Mycelium cannot occupy more than one location")
    end
  end

  # TODO: How does fulfilment of a request work?

end
