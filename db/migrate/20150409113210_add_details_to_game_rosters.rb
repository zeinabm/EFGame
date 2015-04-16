 class AddDetailsToGameRosters < ActiveRecord::Migration
  def change
    add_column :game_rosters, :Name, :text
    add_column :game_rosters, :LastName, :text
    add_column :game_rosters, :City, :text
    add_column :game_rosters, :Country, :text
    add_column :game_rosters, :food, :text
    add_column :game_rosters, :animal, :text
    add_column :game_rosters, :object, :text
  end
end
