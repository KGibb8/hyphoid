class CreateHypha < ActiveRecord::Migration[5.0]
  def change
    create_table :hyphae do |t|
      t.references :mycelium, foreign_key: true
    end
  end
end
