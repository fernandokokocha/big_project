require 'rails_helper'

RSpec.describe "yellow_card_descriptions/index", :type => :view do
  before(:each) do
    assign(:yellow_card_descriptions, [
      YellowCardDescription.create!(
        :description => "Description"
      ),
      YellowCardDescription.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of yellow_card_descriptions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
