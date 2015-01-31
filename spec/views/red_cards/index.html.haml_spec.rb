require 'rails_helper'

RSpec.describe "red_cards/index", :type => :view do
  before(:each) do
    assign(:red_cards, [
      RedCard.create!(),
      RedCard.create!()
    ])
  end

  it "renders a list of red_cards" do
    render
  end
end
