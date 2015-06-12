json.array!(@games) do |game|
  json.extract! game, :id, :creater_id, :number_of_rounds, :number_of_players
  json.url game_url(game, format: :json)
end
