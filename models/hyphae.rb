require './models/mycelium'

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'hyphae', 'hypha'
end

class Hyphae < ActiveRecord::Base
  belongs_to :mycelium
end
