require './models/mycelium'

class Player < ActiveRecord::Base
  has_many :mycelia

  def all_resources
    resources = Hash.new(0)
    self.mycelia.each do |mycelium|
      resources[:carbon] += mycelium.carbon
      resources[:sugars] += mycelium.sugars
      resources[:proteins] += mycelium.proteins
      resources[:nitrates] += mycelium.nitrates
    end
    resources
  end
end
