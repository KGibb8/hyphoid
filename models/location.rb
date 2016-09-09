
require './models/mycelium'

class Location < ActiveRecord::Base
  belongs_to :mycelium, required: false
  belongs_to :level
end

# Location.find((("A".ord - 65) * 5)+ ("2".ord - 48))
