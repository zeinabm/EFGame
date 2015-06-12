class CreateRoundLetters < ActiveRecord::Migration
  def change
    create_table :round_letters do |t|
      t.integer :game_id
      t.string :letter
      t.timestamps
    end
  end
end
