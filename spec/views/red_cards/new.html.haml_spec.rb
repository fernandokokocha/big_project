require 'rails_helper'

RSpec.describe "red_cards/new", :type => :view do
  before(:each) do
    assign(:red_card, RedCard.new())
  end

  it "renders new red_card form" do
    render

    assert_select "form[action=?][method=?]", red_cards_path, "post" do
    end
  end
end
