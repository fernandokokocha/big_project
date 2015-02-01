require 'rails_helper'

RSpec.describe "red_card_descriptions/show", :type => :view do
  before(:each) do
    @red_card_description = assign(:red_card_description, RedCardDescription.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
