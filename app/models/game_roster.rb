class GameRoster < ActiveRecord::Base
  belongs_to :game
  belongs_to :player, :class_name => "User"
  validates_uniqueness_of :game_id, :scope => [:player_id], :message => 'قبلا به بازی پیوسته اید.'
end
