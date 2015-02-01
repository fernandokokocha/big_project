require 'rails_helper'

RSpec.describe "double_yellow_card_descriptions/show", :type => :view do
  before(:each) do
    @double_yellow_card_description = assign(:double_yellow_card_description, DoubleYellowCardDescription.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
