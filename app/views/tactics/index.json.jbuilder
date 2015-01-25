json.array!(@tactics) do |tactic|
  json.extract! tactic, :id, :gk, :d1, :d2, :d3, :d4, :dm1, :dm2, :am1, :am2, :s1, :s2
  json.url tactic_url(tactic, format: :json)
end
