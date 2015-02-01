require 'rails_helper'

RSpec.describe "solo_goal_descriptions/edit", :type => :view do
  before(:each) do
    @solo_goal_description = assign(:solo_goal_description, SoloGoalDescription.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit solo_goal_description form" do
    render

    assert_select "form[action=?][method=?]", solo_goal_description_path(@solo_goal_description), "post" do

      assert_select "input#solo_goal_description_description[name=?]", "solo_goal_description[description]"
    end
  end
end
