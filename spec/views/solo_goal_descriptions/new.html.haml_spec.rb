require 'rails_helper'

RSpec.describe "solo_goal_descriptions/new", :type => :view do
  before(:each) do
    assign(:solo_goal_description, SoloGoalDescription.new(
      :description => "MyString"
    ))
  end

  it "renders new solo_goal_description form" do
    render

    assert_select "form[action=?][method=?]", solo_goal_descriptions_path, "post" do

      assert_select "input#solo_goal_description_description[name=?]", "solo_goal_description[description]"
    end
  end
end
