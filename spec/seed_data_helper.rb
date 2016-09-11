
module SeedData

  def self.extended(object)
    object.instance_exec do

      Hyphae.destroy_all
      Location.destroy_all
      Mycelium.destroy_all
      PlayerSession.destroy_all
      Player.destroy_all
      GameSession.destroy_all
      Game.destroy_all

      # Game Abstract - Rules
      @rules = Game.create

      # Players
      @player1 = Player.create(name: "Mycophile")
      @player2 = Player.create(name: "Dendrophile")
      @player3 = Player.create(name: "Fignut")
      @player4 = Player.create(name: "Tomhead")
      @player5 = Player.create(name: "Blackberry")
      @player6 = Player.create(name: "Applebum")
      @player7 = Player.create(name: "Hoglet")
      @player8 = Player.create(name: "Fantastic Mr. Fox")
      @player9 = Player.create(name: "Mr. Vole")
      @player10 = Player.create(name: "Mr Fieldmouse")
      @player11 = Player.create(name: "Mr Rabbit")

      # Instance of a Game
      @game = @rules.game_sessions.create(grid_size: 5)

      # Adding players to single GameSession
      @game.player_sessions.create(player: @player1)
      @game.player_sessions.create(player: @player2)

      # Game starts upon players joining game - GameSession initialises grid
      @game.draw_map

      # Player building Mycelia
      @mycelium1 = @player1.mycelia.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)
      @mycelium2 = @player1.mycelia.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)

      # Can we have resources initialize as a base minimum?
      @mycelium3 = @mycelium1.children.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)
      # Check - does mycelium3 belong to @player1?

      # Sets location of mycelium
      @game.grid[1][3].update(mycelium: @mycelium1)
      @game.grid[0][1].update(mycelium: @mycelium3)





    end
  end
end
