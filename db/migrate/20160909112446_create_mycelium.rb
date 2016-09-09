class CreateMycelium < ActiveRecord::Migration[5.0]
  def change
    create_table :mycelia do |t|
      t.references :player, foreign_key: true
      t.integer :carbon
      t.integer :nitrates
      t.integer :phosphates
      t.integer :sugars
    end
  end
end
