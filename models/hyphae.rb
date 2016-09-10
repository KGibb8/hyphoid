ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'hyphae', 'hypha'
end

require './models/mycelium'

class Hyphae < ActiveRecord::Base
  belongs_to :mycelium
end
