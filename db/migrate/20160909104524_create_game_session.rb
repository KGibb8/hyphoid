class CreateGameSession < ActiveRecord::Migration[5.0]
  def change
    create_table :game_sessions do |t|
      t.references :game, foreign_key: true
      t.integer :grid_size
    end
  end
end
