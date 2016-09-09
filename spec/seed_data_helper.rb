
require './models/player'
require './models/location'
require './models/mycelium'

module SeedData

  def self.extended(object)
    object.instance_exec do

      Location.destroy_all
      Mycelium.destroy_all
      Player.destroy_all

      # Players
      @player1 = Player.create(name: "Mycophile")
      @player2 = Player.create(name: "Dendrophile")

      # Mycelia
      @mycelium1 = Mycelium.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)
      @mycelium2 = Mycelium.create(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)

      # Locations in a 5x5 grid

      x_grid = "A B C D E".split
      y_grid = "1 2 3 4 5".split

      x_grid.each do |x|
        y_grid.each do |y|
          instance_variable_set("@#{x.downcase}#{y}", Location.create(x_position: x, y_position: y))
        end
      end

      @b4.update(mycelium: @mycelium1)

      @player1.mycelia << @mycelium1
      @player1.mycelia << @mycelium2

    end
  end
end
