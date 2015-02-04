class InjuryDescription < ActiveRecord::Base
  validates :description, format: { with: /X/, message: 'has to have X' }
end
