
# require './models/location'
require './models/hyphae'
require './models/mushroom'
require './models/spore'
# require './models/request'

class Mycelium < ActiveRecord::Base
  belongs_to :player
  # belongs_to :location
  has_many :hypha
  has_many :mushrooms
  has_many :spores, through: :mushrooms
  # has_many :requests

  def resources
    {carbon: self.carbon, sugars: self.sugars, phosphates: self.phosphates, nitrates: self.nitrates}
  end

end
