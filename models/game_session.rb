require './models/location'
require './models/player_session'
require './models/game'

class GameSession < ActiveRecord::Base
  has_many :player_sessions
  belongs_to :game
  has_many :locations

  attr_accessor :grid

  def players
    self.player_sessions.map {|player_session| player_session.player}
  end

  def draw_map
    self.grid = self.game.initialize_grid(self.grid_size)
  end

end
