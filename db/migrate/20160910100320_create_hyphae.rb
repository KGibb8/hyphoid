class CreateHyphae < ActiveRecord::Migration[5.0]
  def change
    create_table :hypha do |t|
      t.references :mycelium, foreign_key: true
    end
  end
end
