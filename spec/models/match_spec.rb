require 'rails_helper'

RSpec.describe Match, :type => :model do
  it 'has match events ordered by time inc' do
    match = Match.new
    event1 = MatchEvent.create!(:event_type => "goal", :time => 10, :match => match)
    event3 = MatchEvent.create!(:event_type => "goal", :time => 30, :match => match)
    event2 = MatchEvent.create!(:event_type => "yellow card", :time => 20, :match => match)

    expect(match.events).to eq([event1, event2, event3])
  end
end
