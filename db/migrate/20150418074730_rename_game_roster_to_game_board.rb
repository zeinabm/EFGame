class RenameGameRosterToGameBoard < ActiveRecord::Migration
  def change
    rename_table :game_rosters, :game_boards
  end
end
