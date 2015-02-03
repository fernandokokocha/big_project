class Match < ActiveRecord::Base
  belongs_to :home, class_name: 'Team'
  belongs_to :away, class_name: 'Team'

  has_many :match_events

  def events
    match_events.order(:time)
  end
end
