require 'rails_helper'

RSpec.describe "matches/edit", :type => :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :home_score => 1,
      :away_score => 1,
      :attendance => 1,
      :report => "MyText"
    ))
  end

  it "renders the edit match form" do
    render

    assert_select "form[action=?][method=?]", match_path(@match), "post" do

      assert_select "input#match_home_score[name=?]", "match[home_score]"

      assert_select "input#match_away_score[name=?]", "match[away_score]"

      assert_select "input#match_attendance[name=?]", "match[attendance]"

      assert_select "textarea#match_report[name=?]", "match[report]"
    end
  end
end
