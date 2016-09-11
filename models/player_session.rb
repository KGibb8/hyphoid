require './models/player'
require './models/game'

class PlayerSession < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

end
