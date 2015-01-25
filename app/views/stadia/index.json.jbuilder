json.array!(@stadia) do |stadium|
  json.extract! stadium, :id, :name, :capacity, :roof
  json.url stadium_url(stadium, format: :json)
end
