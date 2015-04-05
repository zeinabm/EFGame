class Game < ActiveRecord::Base
	belongs_to :creater, :class_name => "User"
  has_many :game_rosters
  has_many :players, through: :game_rosters, :source => :player
<<<<<<< HEAD
  has_many :round_letters
=======
>>>>>>> 113efc876576f3b109de6fdafecaa8292ff74f9b
  #has_and_belongs_to_many :players, :class_name => "User"
end
