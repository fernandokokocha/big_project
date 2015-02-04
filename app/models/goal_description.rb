class GoalDescription < ActiveRecord::Base
  validates :description, format: { with: /X/, message: 'has to have X'}
  validates :description, format: { with: /Y/, message: 'has to have Y'}
end
