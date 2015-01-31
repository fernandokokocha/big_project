require 'rails_helper'

RSpec.describe "red_cards/show", :type => :view do
  before(:each) do
    @red_card = assign(:red_card, RedCard.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
