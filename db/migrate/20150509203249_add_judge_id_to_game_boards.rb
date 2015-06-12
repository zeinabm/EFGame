class AddJudgeIdToGameBoards < ActiveRecord::Migration
  def change
    add_column :game_boards, :judge_id, :integer
  end
end
