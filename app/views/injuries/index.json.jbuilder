json.array!(@injuries) do |injury|
  json.extract! injury, :id
  json.url injury_url(injury, format: :json)
end
