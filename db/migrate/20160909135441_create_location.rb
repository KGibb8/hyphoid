class CreateLocation < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.references :mycelium
      t.string :x_position
      t.string :y_position
    end
  end
end
