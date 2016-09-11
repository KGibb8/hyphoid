class CreateSpore < ActiveRecord::Migration[5.0]
  def change
    create_table :spores do |t|
      t.references :mushroom, foreign_key: true
    end
  end
end
