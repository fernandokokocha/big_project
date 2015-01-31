require 'rails_helper'

RSpec.describe "yellow_cards/index", :type => :view do
  before(:each) do
    assign(:yellow_cards, [
      YellowCard.create!(),
      YellowCard.create!()
    ])
  end

  it "renders a list of yellow_cards" do
    render
  end
end
