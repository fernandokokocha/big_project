json.array!(@red_card_descriptions) do |red_card_description|
  json.extract! red_card_description, :id, :description
  json.url admin_red_card_description_url(red_card_description, format: :json)
end
