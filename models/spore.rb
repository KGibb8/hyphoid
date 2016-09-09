
require './models/mushroom'

class Spore < ActiveRecord::Base
  belongs_to :mushroom
end
