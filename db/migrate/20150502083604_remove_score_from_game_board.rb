class RemoveScoreFromGameBoard < ActiveRecord::Migration
  def change
    remove_column :game_boards, :score, :integer
  end
end
