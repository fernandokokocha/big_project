require 'rails_helper'

RSpec.describe "match_events/new", :type => :view do
  before(:each) do
    assign(:match_event, MatchEvent.new(
      :type => "",
      :time => 1,
      :description => "MyString"
    ))
  end

  it "renders new match_event form" do
    render

    assert_select "form[action=?][method=?]", match_events_path, "post" do

      assert_select "input#match_event_type[name=?]", "match_event[type]"

      assert_select "input#match_event_time[name=?]", "match_event[time]"

      assert_select "input#match_event_description[name=?]", "match_event[description]"
    end
  end
end
