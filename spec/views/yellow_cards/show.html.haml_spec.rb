require 'rails_helper'

RSpec.describe "yellow_cards/show", :type => :view do
  before(:each) do
    @yellow_card = assign(:yellow_card, YellowCard.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
