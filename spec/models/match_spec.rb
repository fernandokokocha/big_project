require 'rails_helper'

RSpec.describe Match, :type => :model do
  it 'prints nicely' do
    home = build(:team, :name => 'Home Team')
    away = build(:team, :name => 'Away Team')
    match = Match.new(:date => Date.today,
                      :home => home,
                      :away => away,
                      :home_score => 1,
                      :away_score => 2)
    expect(match.to_s).to eq("#{Date.today}: Home Team 1-2 Away Team")
  end

  it 'has match events ordered by time inc' do
    match = Match.new
    event1 = MatchEvent.create!(:event_type => 'goal', :time => 10, :match => match)
    event3 = MatchEvent.create!(:event_type => 'goal', :time => 30, :match => match)
    event2 = MatchEvent.create!(:event_type => 'yellow card', :time => 20, :match => match)

    expect(match.events).to eq([event1, event2, event3])
  end
end
