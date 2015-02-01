require 'rails_helper'

RSpec.describe "double_yellow_card_descriptions/index", :type => :view do
  before(:each) do
    assign(:double_yellow_card_descriptions, [
      DoubleYellowCardDescription.create!(
        :description => "Description"
      ),
      DoubleYellowCardDescription.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of double_yellow_card_descriptions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
