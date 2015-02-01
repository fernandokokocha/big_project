require 'rails_helper'

RSpec.describe "goal_descriptions/index", :type => :view do
  before(:each) do
    assign(:goal_descriptions, [
      GoalDescription.create!(
        :description => "Description"
      ),
      GoalDescription.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of goal_descriptions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
