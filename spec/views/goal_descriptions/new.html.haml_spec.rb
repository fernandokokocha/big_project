require 'rails_helper'

RSpec.describe "goal_descriptions/new", :type => :view do
  before(:each) do
    assign(:goal_description, GoalDescription.new(
      :description => "MyString"
    ))
  end

  it "renders new goal_description form" do
    render

    assert_select "form[action=?][method=?]", goal_descriptions_path, "post" do

      assert_select "input#goal_description_description[name=?]", "goal_description[description]"
    end
  end
end
