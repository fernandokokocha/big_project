json.array!(@injury_descriptions) do |injury_description|
  json.extract! injury_description, :id, :description
  json.url injury_description_url(injury_description, format: :json)
end
