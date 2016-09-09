
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
  # has_many :requests
  validate :singular

  def resources
    {carbon: self.carbon, sugars: self.sugars, proteins: self.proteins, nitrates: self.nitrates}
  end

  private

  def singular
    unless self.location.nil?
      self.errors.add(:location, "A Mycelium cannot occupy more than one location")
    end
  end

end
