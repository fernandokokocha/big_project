json.array!(@assists) do |assist|
  json.extract! assist, :id
  json.url assist_url(assist, format: :json)
end
