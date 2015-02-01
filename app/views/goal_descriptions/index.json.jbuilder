json.array!(@goal_descriptions) do |goal_description|
  json.extract! goal_description, :id, :description
  json.url goal_description_url(goal_description, format: :json)
end
