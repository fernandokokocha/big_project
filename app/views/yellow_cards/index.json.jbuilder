json.array!(@yellow_cards) do |yellow_card|
  json.extract! yellow_card, :id
  json.url yellow_card_url(yellow_card, format: :json)
end
