class AddRoundNumberToRoundLetters < ActiveRecord::Migration
  def change
    add_column :round_letters, :round_number, :integer
  end
end
