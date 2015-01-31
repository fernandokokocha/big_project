require 'rails_helper'

RSpec.describe "matches/index", :type => :view do
  before(:each) do
    assign(:matches, [
      Match.create!(
        :home_score => 1,
        :away_score => 2,
        :attendance => 3,
        :report => "MyText"
      ),
      Match.create!(
        :home_score => 1,
        :away_score => 2,
        :attendance => 3,
        :report => "MyText"
      )
    ])
  end

  it "renders a list of matches" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
