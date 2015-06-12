class AddHasBeenJudgedToGameBoards < ActiveRecord::Migration
  def change
    add_column :game_boards, :has_been_judged?, :boolean, :default => 0
  end
end
