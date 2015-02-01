require 'rails_helper'

RSpec.describe "goal_descriptions/show", :type => :view do
  before(:each) do
    @goal_description = assign(:goal_description, GoalDescription.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
