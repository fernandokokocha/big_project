class YellowCardDescription < ActiveRecord::Base
  validates :description, presence: true
  validates :description, format: { with: /X/, message: "has to have X" }
end
