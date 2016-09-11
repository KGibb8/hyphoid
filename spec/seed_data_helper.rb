
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

      binding.pry

      # Game Abstract - Rules
      @rules = Game.create

      # Players
      @player1 = Player.create(name: "Mycophile")
      @player2 = Player.create(name: "Dendrophile")

      # Instance of a Game
      @game = GameSession.create(grid_size: 5)

      # Adding players to single GameSession
      @game.player_sessions.create(player: @player1)
      @game.player_sessions.create(player: @player2)
      # @game.players.count == 2
      # Now in theory we can do @player1.games.first == @game
      # We can also do @game.grid which contains all of our location objects in their correct position

      @mycelium1 = @player1.mycelia.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)
      @mycelium2 = @player1.mycelia.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)



      # # Locations in a 5x5 grid
      # x_grid = "A B C D E".split
      # y_grid = "1 2 3 4 5".split
      #
      # x_grid.each do |x|
      #   y_grid.each do |y|
      #     instance_variable_set("@#{x.downcase}#{y}", Location.create(x_position: x, y_position: y))
      #   end
      # end

      # Mycelia
      # Can we have resources initialize as a base minimum?
      # @mycelium1 = Mycelium.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)
      # @mycelium2 = Mycelium.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)
      @mycelium3 = @mycelium1.children.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)

      # Sets location of mycelium
      @b4.update(mycelium: @mycelium1)
      @a2.mycelium = @mycelium3
      @a2.save

      @a3.mycelium = @mycelium2

      # Associates mycelia with Player
      @player1.mycelia << @mycelium1
      @player1.mycelia << @mycelium2



    end
  end
end
