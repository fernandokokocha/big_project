json.array!(@yellow_card_descriptions) do |yellow_card_description|
  json.extract! yellow_card_description, :id, :description
  json.url yellow_card_description_url(yellow_card_description, format: :json)
end
