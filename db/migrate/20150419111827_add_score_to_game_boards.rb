class AddScoreToGameBoards < ActiveRecord::Migration
  def change
    add_column :game_boards, :score, :integer
  end
   def up
    add_column :game_boards, :score, :integer, :default => 0
  end
end
