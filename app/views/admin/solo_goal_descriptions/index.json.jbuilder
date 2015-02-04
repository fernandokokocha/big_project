json.array!(@solo_goal_descriptions) do |solo_goal_description|
  json.extract! solo_goal_description, :id, :description
  json.url admin_solo_goal_description_url(solo_goal_description, format: :json)
end
