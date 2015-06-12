class RoundLetter < ActiveRecord::Base
	belongs_to :game
	
	def self.new_round_letter(game_id_in,round_letter_in,round_number_in)
		 @round_letter = RoundLetter.create(:game_id => game_id_in, :letter => round_letter_in , :round_number => round_number_in)
	end
	
	
end
