
require './models/game'
require './models/mycelium'

class Location < ActiveRecord::Base
  belongs_to :mycelium, required: false
  belongs_to :game

  # validate :singular

  private

  # def singular
  #   unless Mycelium.find_by(location: self)
  #     self.errors.add(:location, "A Mycelium cannot occupy more than one location")
  #   end
  #
  #   unless self.mycelium.nil?
  #     self.errors.add(:mycelium, "A location cannot contain more than one mycelium")
  #   end
  # end

end
