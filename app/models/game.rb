class Game < ActiveRecord::Base
	belongs_to :creater, :class_name => "User"
  has_many :game_rosters
  has_many :players, through: :game_rosters, :source => :player
  has_many :round_letters
  
  scope :not_started, lambda {
    joins(:game_rosters).
      select('games.*').
      group('game_rosters.game_id').
      having('count(game_rosters.game_id) < games.number_of_players')
    }
end
