require 'rails_helper'

RSpec.describe "stadia/index", :type => :view do
  before(:each) do
    assign(:stadia, [
      Stadium.create!(
        :name => "Name",
        :capacity => 1,
        :roof => false
      ),
      Stadium.create!(
        :name => "Name",
        :capacity => 1,
        :roof => false
      )
    ])
  end

  it "renders a list of stadia" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
