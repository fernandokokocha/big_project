json.array!(@match_events) do |match_event|
  json.extract! match_event, :id, :type, :time, :description
  json.url match_event_url(match_event, format: :json)
end
