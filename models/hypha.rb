ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'hypha', 'hyphae'
end

require './models/mycelium'

class Hypha < ActiveRecord::Base
  belongs_to :mycelium

  after_create :building_cost

  def mine
    self.mycelium.carbon += 5
    self.mycelium.nitrates += 5
    self.mycelium.proteins += 5
    # self.mycelium.resources.map { |resource, quantity| quantity += 5 }
    # TODO: Lorin? Why doesn't this work?
    binding.pry
  end

  private

  def building_cost
    self.mycelium.proteins -= 10
  end

end
