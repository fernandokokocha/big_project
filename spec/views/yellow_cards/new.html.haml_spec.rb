require 'rails_helper'

RSpec.describe "yellow_cards/new", :type => :view do
  before(:each) do
    assign(:yellow_card, YellowCard.new())
  end

  it "renders new yellow_card form" do
    render

    assert_select "form[action=?][method=?]", yellow_cards_path, "post" do
    end
  end
end
