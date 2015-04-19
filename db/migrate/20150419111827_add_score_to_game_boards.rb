class AddScoreToGameBoards < ActiveRecord::Migration
  def change
    add_column :game_boards, :score, :integer
  end
end
