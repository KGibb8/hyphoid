class CreateMycelium < ActiveRecord::Migration[5.0]
  def change
    create_table :mycelia do |t|
      t.references :player, foreign_key: true
      t.references :mother
      t.integer :carbon, default: 100
      t.integer :nitrates, default: 100
      t.integer :proteins, default: 100
      t.integer :sugars, default: 50
    end
  end
end
