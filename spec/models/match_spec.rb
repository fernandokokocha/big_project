require 'rails_helper'

RSpec.describe Match, :type => :model do
  before (:each) do
    @home = build(:team, :name => 'Home Team')
    @away = build(:team, :name => 'Away Team')
  end

  it 'prints nicely' do
    match = build(:match,
                  :date => Date.today,
                  :home => @home,
                  :away => @away,
                  :home_score => 1,
                  :away_score => 2)
    expect(match.to_s).to eq("#{Date.today}: Home Team 1-2 Away Team")
    expect(match.bold_name @home).to eq("#{Date.today}: <b>Home Team</b> 1-2 Away Team")
  end

  it 'has match events ordered by time inc' do
    match = Match.new
    event1 = MatchEvent.create!(:event_type => 'goal', :time => 10, :match => match)
    event3 = MatchEvent.create!(:event_type => 'goal', :time => 30, :match => match)
    event2 = MatchEvent.create!(:event_type => 'yellow card', :time => 20, :match => match)

    expect(match.events).to eq([event1, event2, event3])
  end

  it 'knows who is the winner' do
    match = Match.new(:home_score => 1, :away_score => 0)
    expect(match.home_win).to eq(true)
    expect(match.away_win).to eq(false)
    expect(match.draw).to eq(false)

    match = Match.new(:home_score => 0, :away_score => 1)
    expect(match.home_win).to eq(false)
    expect(match.away_win).to eq(true)
    expect(match.draw).to eq(false)

    match = Match.new(:home_score => 0, :away_score => 0)
    expect(match.home_win).to eq(false)
    expect(match.away_win).to eq(false)
    expect(match.draw).to eq(true)
  end

  it 'knows who participates' do
    match = Match.new(:home => @home, :away => @away)
    expect(match.participant? @home).to eq(true)
    expect(match.participant? @away).to eq(true)

    observer = build(:team, :name => 'Observer')
    expect(match.participant? observer).to eq(false)
  end
end
