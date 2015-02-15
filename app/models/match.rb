class Match < ActiveRecord::Base
  belongs_to :home, class_name: 'Team'
  belongs_to :away, class_name: 'Team'

  has_many :match_events

  def to_s
    "#{date}: #{home.name} #{home_score}-#{away_score} #{away.name}"
  end

  def events
    match_events.order(:time)
  end

  def home_win
    home_score > away_score
  end

  def away_win
    home_score < away_score
  end

  def draw
    home_score == away_score
  end

  def participant? team
    home == team or away == team
  end

  def bold_name team
    name = to_s
    name.sub(team.name, "<b>#{team.name}</b>").html_safe
  end
end
