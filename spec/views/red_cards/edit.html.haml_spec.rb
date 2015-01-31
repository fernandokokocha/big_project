require 'rails_helper'

RSpec.describe "red_cards/edit", :type => :view do
  before(:each) do
    @red_card = assign(:red_card, RedCard.create!())
  end

  it "renders the edit red_card form" do
    render

    assert_select "form[action=?][method=?]", red_card_path(@red_card), "post" do
    end
  end
end
