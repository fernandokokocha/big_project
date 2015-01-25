require 'rails_helper'

RSpec.describe "positions/index", :type => :view do
  before(:each) do
    assign(:positions, [
      Position.create!(
        :name => "Name",
        :value => 1
      ),
      Position.create!(
        :name => "Name",
        :value => 1
      )
    ])
  end

  it "renders a list of positions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
