json.array!(@matches) do |match|
  json.extract! match, :id, :home_score, :away_score, :date, :attendance, :report
  json.url match_url(match, format: :json)
end
