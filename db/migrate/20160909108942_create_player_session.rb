class CreatePlayerSession < ActiveRecord::Migration[5.0]
  def change
    create_table :player_sessions do |t|
      t.references :player, foreign_key: true
      t.references :game_session, foreign_key: true
    end
  end
end
