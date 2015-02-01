json.array!(@double_yellow_card_descriptions) do |double_yellow_card_description|
  json.extract! double_yellow_card_description, :id, :description
  json.url double_yellow_card_description_url(double_yellow_card_description, format: :json)
end
