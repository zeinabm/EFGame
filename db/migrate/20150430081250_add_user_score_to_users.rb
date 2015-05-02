class AddUserScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_score, :integer
  end
end
