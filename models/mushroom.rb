
require './models/mycelium'
require './models/spore'

class Mushroom < ActiveRecord::Base
  belongs_to :mycelium
  has_many :spores
end
