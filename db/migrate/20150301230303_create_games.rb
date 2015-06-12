class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :creater_id
      t.integer :number_of_rounds
      t.integer :number_of_players

      t.timestamps
    end
  end
end
