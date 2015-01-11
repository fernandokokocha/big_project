json.array!(@teams) do |team|
  json.extract! team, :id, :name, :balance
  json.url team_url(team, format: :json)
end
