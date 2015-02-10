json.array!(@leagues) do |league|
  json.extract! league, :id, :name, :win_points, :draw_points, :win_price, :draw_price, :top_scorer_price, :best_assistant_price
  json.url admin_league_url(league, format: :json)
end
