json.array!(@game_rosters) do |game_roster|
  json.extract! game_roster, :id, :game_id, :player_id
  json.url game_roster_url(game_roster, format: :json)
end
