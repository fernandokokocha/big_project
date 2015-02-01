require 'rails_helper'

RSpec.describe "solo_goal_descriptions/show", :type => :view do
  before(:each) do
    @solo_goal_description = assign(:solo_goal_description, SoloGoalDescription.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
