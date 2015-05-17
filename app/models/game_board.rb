class GameBoard < ActiveRecord::Base
  belongs_to :game
  belongs_to :player, :class_name => "User"
  belongs_to :judge, :class_name => "User"
  validates_uniqueness_of :game_id, :scope => [:player_id], :message => 'قبلا به این بازی پیوسته اید.'
  validates_uniqueness_of :player_id, :message => 'شما به بازی دیگری پیوسته اید'

end
