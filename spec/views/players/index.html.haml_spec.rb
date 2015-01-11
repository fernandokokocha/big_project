require 'rails_helper'

RSpec.describe "players/index", :type => :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :position => "Position",
        :salary => 1,
        :reflex => 2,
        :handling => 3,
        :discipline => 4,
        :tackling => 5,
        :work_rate => 6,
        :positioning => 7,
        :creativity => 8,
        :technique => 9,
        :instinct => 10,
        :shots => 11,
        :condition => 12
      ),
      Player.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :position => "Position",
        :salary => 1,
        :reflex => 2,
        :handling => 3,
        :discipline => 4,
        :tackling => 5,
        :work_rate => 6,
        :positioning => 7,
        :creativity => 8,
        :technique => 9,
        :instinct => 10,
        :shots => 11,
        :condition => 12
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
  end
end
