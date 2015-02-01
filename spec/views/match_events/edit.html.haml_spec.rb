require 'rails_helper'

RSpec.describe "match_events/edit", :type => :view do
  before(:each) do
    @match_event = assign(:match_event, MatchEvent.create!(
      :type => "",
      :time => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit match_event form" do
    render

    assert_select "form[action=?][method=?]", match_event_path(@match_event), "post" do

      assert_select "input#match_event_type[name=?]", "match_event[type]"

      assert_select "input#match_event_time[name=?]", "match_event[time]"

      assert_select "input#match_event_description[name=?]", "match_event[description]"
    end
  end
end
