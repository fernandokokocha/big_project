require 'rails_helper'

RSpec.describe "teams/new", :type => :view do
  before(:each) do
    assign(:team, Team.new(
      :name => "MyString",
      :balance => 1
    ))
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input#team_name[name=?]", "team[name]"

      assert_select "input#team_balance[name=?]", "team[balance]"
    end
  end
end
