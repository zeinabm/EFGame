class AddDoneToGame < ActiveRecord::Migration
  def change
    add_column :games, :done, :integer
  end
end
