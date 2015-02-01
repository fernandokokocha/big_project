require 'rails_helper'

RSpec.describe "goal_descriptions/edit", :type => :view do
  before(:each) do
    @goal_description = assign(:goal_description, GoalDescription.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit goal_description form" do
    render

    assert_select "form[action=?][method=?]", goal_description_path(@goal_description), "post" do

      assert_select "input#goal_description_description[name=?]", "goal_description[description]"
    end
  end
end
