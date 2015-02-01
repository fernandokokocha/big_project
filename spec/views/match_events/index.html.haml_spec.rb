require 'rails_helper'

RSpec.describe "match_events/index", :type => :view do
  before(:each) do
    assign(:match_events, [
      MatchEvent.create!(
        :type => "Type",
        :time => 1,
        :description => "Description"
      ),
      MatchEvent.create!(
        :type => "Type",
        :time => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of match_events" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
