require 'rails_helper'

RSpec.describe "solo_goal_descriptions/index", :type => :view do
  before(:each) do
    assign(:solo_goal_descriptions, [
      SoloGoalDescription.create!(
        :description => "Description"
      ),
      SoloGoalDescription.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of solo_goal_descriptions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
