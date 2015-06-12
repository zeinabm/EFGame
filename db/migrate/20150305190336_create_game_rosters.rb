class CreateGameRosters < ActiveRecord::Migration
  def change
    create_table :game_rosters do |t|
      t.integer :game_id
      t.integer :player_id

      t.timestamps
    end
  end
end
