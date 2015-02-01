require 'rails_helper'

RSpec.describe "yellow_card_descriptions/show", :type => :view do
  before(:each) do
    @yellow_card_description = assign(:yellow_card_description, YellowCardDescription.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
