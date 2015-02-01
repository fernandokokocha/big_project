class Match < ActiveRecord::Base
  belongs_to :home, class_name: 'Team'
  belongs_to :away, class_name: 'Team'

  has_many :match_events
end
