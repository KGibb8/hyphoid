class CreateGame < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :grid_size
    end
  end
end
