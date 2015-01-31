require 'rails_helper'

RSpec.describe "yellow_cards/edit", :type => :view do
  before(:each) do
    @yellow_card = assign(:yellow_card, YellowCard.create!())
  end

  it "renders the edit yellow_card form" do
    render

    assert_select "form[action=?][method=?]", yellow_card_path(@yellow_card), "post" do
    end
  end
end
