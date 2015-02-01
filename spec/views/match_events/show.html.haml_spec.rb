require 'rails_helper'

RSpec.describe "match_events/show", :type => :view do
  before(:each) do
    @match_event = assign(:match_event, MatchEvent.create!(
      :type => "Type",
      :time => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Description/)
  end
end
