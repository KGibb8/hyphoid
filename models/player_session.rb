require './models/player'
require './models/game_session'

class PlayerSession < ActiveRecord::Base
  belongs_to :player
  belongs_to :game_session

end
