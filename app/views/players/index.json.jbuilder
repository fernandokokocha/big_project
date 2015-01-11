json.array!(@players) do |player|
  json.extract! player, :id, :first_name, :last_name, :birthdate, :position, :salary, :reflex, :handling, :discipline, :tackling, :work_rate, :positioning, :creativity, :technique, :instinct, :shots, :condition
  json.url player_url(player, format: :json)
end
