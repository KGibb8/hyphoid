
module SeedData

  def self.extended(object)
    object.instance_exec do

      Hypha.destroy_all
      Location.destroy_all
      Mycelium.destroy_all
      PlayerSession.destroy_all
      Player.destroy_all
      Game.destroy_all

      # Players
      @player1 = Player.create!(name: "Mycophile")
      @player2 = Player.create!(name: "Dendrophile")
      @player3 = Player.create!(name: "Fignut")
      @player4 = Player.create!(name: "Tomhead")
      @player5 = Player.create!(name: "Blackberry")
      @player6 = Player.create!(name: "Applebum")
      @player7 = Player.create!(name: "Hoglet")
      @player8 = Player.create!(name: "Fantastic Mr. Fox")
      @player9 = Player.create!(name: "Mr. Vole")
      @player10 = Player.create!(name: "Mr Fieldmouse")
      @player11 = Player.create!(name: "Mr Rabbit")

      # GameSession 1
      @game1 = Game.create!(grid_size: 5)

      # GameSession 2
      @game2 = Game.create!(grid_size: 10)

      # Adding players to GameSession 1
      @game1.player_sessions.create!(player: @player1)
      @game1.player_sessions.create!(player: @player2)

      # Adding players to GameSession 2
      @game2.player_sessions.create!(player: @player3)
      @game2.player_sessions.create!(player: @player4)
      @game2.player_sessions.create!(player: @player5)
      @game2.player_sessions.create!(player: @player6)

################################################################################
################################################################################

      # New game starts upon players joining @game1 - GameSession initialises grid
      @game1.initialize_grid
      @game2.initialize_grid
      # No players can now join the game

      # @player1 building Mycelia
      @mycelium1 = @player1.mycelia.create(location: @game1.grid[1][3])
      @mycelium2 = @player1.mycelia.create(location: @game1.grid[2][3])

      # @player1's first mycelium spawning a new child
      @mycelium3 = @player1.mycelia.create(location: @game1.grid[0][1], mother: @mycelium1)

      # Building hyphae
      @mycelium1.build_hypha



      # Sets location of mycelium
      # @game1.grid[1][3].update(mycelium: @mycelium1)
      # .update(mycelium: @mycelium2)
      # .update(mycelium: @mycelium3)

      # Sets location of new child
      # @game1.grid[2][4].update(mycelium: @mycelium3)
    end
  end
end
