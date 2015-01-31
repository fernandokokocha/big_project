require 'rails_helper'

RSpec.describe "matches/new", :type => :view do
  before(:each) do
    assign(:match, Match.new(
      :home_score => 1,
      :away_score => 1,
      :attendance => 1,
      :report => "MyText"
    ))
  end

  it "renders new match form" do
    render

    assert_select "form[action=?][method=?]", matches_path, "post" do

      assert_select "input#match_home_score[name=?]", "match[home_score]"

      assert_select "input#match_away_score[name=?]", "match[away_score]"

      assert_select "input#match_attendance[name=?]", "match[attendance]"

      assert_select "textarea#match_report[name=?]", "match[report]"
    end
  end
end
