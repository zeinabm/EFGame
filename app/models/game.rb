class Game < ActiveRecord::Base
	belongs_to :creater, :class_name => "User"
  has_many :game_boards
  has_many :players, through: :game_boards, :source => :player
  has_many :round_letters
  
  scope :not_started, lambda {
    joins(:game_boards).
      select('games.*').
      group('game_boards.game_id').
      having('count(game_boards.game_id) < games.number_of_players')
    }
end
