
require './models/player'
require './models/mycelium'

module SeedData

  def self.extended(object)
    object.instance_exec do

      Mycelium.destroy_all
      Player.destroy_all

      # Players
      @player1 = Player.create(name: "Mycophile")
      @player2 = Player.create(name: "Dendrophile")

      # Mycelia
      @mycelium1 = Mycelium.create(carbon: 100, sugars: 100, phosphates: 100, nitrates: 100)
      @mycelium2 = Mycelium.create(carbon: 100, sugars: 100, phosphates: 100, nitrates: 100)

      @player1.mycelia << @mycelium1
      @player1.mycelia << @mycelium2

    end
  end
end
