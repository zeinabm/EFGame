json.array!(@round_letters) do |round_letter|
  json.extract! round_letter, :id, :game_id, :letter
  json.url round_letter_url(round_letter, format: :json)
end
