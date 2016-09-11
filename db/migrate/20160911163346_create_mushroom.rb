class CreateMushroom < ActiveRecord::Migration[5.0]
  def change
    create_table :mushrooms do |t|
      t.references :mycelium, foreign_key: true
    end
  end
end
