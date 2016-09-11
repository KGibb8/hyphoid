ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'hypha', 'hyphae'
end

require './models/mycelium'

class Hypha < ActiveRecord::Base
  belongs_to :mycelium
end
