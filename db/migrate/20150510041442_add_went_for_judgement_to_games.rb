class AddWentForJudgementToGames < ActiveRecord::Migration
  def change
    add_column :games, :went_for_judgement, :boolean, :default => 0
  end
end
