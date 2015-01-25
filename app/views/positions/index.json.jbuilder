json.array!(@positions) do |position|
  json.extract! position, :id, :name, :value
  json.url position_url(position, format: :json)
end
