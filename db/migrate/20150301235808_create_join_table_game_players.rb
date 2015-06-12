class CreateJoinTableGamePlayers < ActiveRecord::Migration
  def change
    create_join_table :Games, :Users do |t|
      # t.index [:game_id, :user_id]
      # t.index [:user_id, :game_id]
    end
  end
end
