
require 'standalone_migrations'
require './models/player'
require './spec/seed_data_helper'
require 'rspec'
require 'pry'

ActiveRecord::Base.establish_connection YAML.load_file('config/database.yml')["test"]

describe Player do

  before do
    extend SeedData
  end

  it "should know about it's mycelia" do
    expect(@player1.mycelia.first).to eq(@mycelium1)
  end

  it "should be able to contain multiple mycelia" do
    expect(@player1.mycelia.count).to be >= 2
  end

  context "Viewing Resources --> " do
    it "should be able to view all mycelia and their relative resource stock" do
      expect(@player1.all_resources).to eq(carbon: 200, sugars: 200, proteins: 200, nitrates: 200)
    end

    it "should be able to select individual mycelia and view their localised resource stock" do
      expect(@player1.mycelia.find_by(id: @mycelium1.id).resources).to eq(carbon: 100, sugars: 100, proteins: 100, nitrates: 100)
    end
  end

  context "more than one mycelium" do
    it "should know " do
  end

  after do
    ActiveRecord::Base.connection.close
  end

end


# should be able to view all Mycelia and their relative resource count
# should be able to display a total_resource count
# should be able to see which mycelium is it's "mothership" --> mothership = nil HOOK on creation set it's mothership
# should be able to view the hierarchy of mycelia
# should be able to
# should be able to spend accrued resources?

# should be able to join a room
# should be able to view other players in a room
# should be able to send a message to other players
#
