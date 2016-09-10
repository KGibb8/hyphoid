
require './models/game_session'
require './models/mycelium'

class Location < ActiveRecord::Base
  belongs_to :mycelium, required: false
  belongs_to :game

  validate :singular

  private

  def singular
    unless self.mycelium.nil?
      self.errors.add(:mycelium, "A location cannot contain more than one mycelium")
    end
  end

end

# Location.find((("A".ord - 65) * 5)+ ("2".ord - 48))
