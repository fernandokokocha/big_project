require 'rails_helper'

RSpec.describe "red_card_descriptions/index", :type => :view do
  before(:each) do
    assign(:red_card_descriptions, [
      RedCardDescription.create!(
        :description => "Description"
      ),
      RedCardDescription.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of red_card_descriptions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
