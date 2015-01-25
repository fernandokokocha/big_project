require 'rails_helper'

RSpec.describe "tactics/index", :type => :view do
  before(:each) do
    assign(:tactics, [
      Tactic.create!(
        :gk => "Gk",
        :d1 => "D1",
        :d2 => "D2",
        :d3 => "D3",
        :d4 => "D4",
        :dm1 => "Dm1",
        :dm2 => "Dm2",
        :am1 => "Am1",
        :am2 => "Am2",
        :s1 => "S1",
        :s2 => 1
      ),
      Tactic.create!(
        :gk => "Gk",
        :d1 => "D1",
        :d2 => "D2",
        :d3 => "D3",
        :d4 => "D4",
        :dm1 => "Dm1",
        :dm2 => "Dm2",
        :am1 => "Am1",
        :am2 => "Am2",
        :s1 => "S1",
        :s2 => 1
      )
    ])
  end

  it "renders a list of tactics" do
    render
    assert_select "tr>td", :text => "Gk".to_s, :count => 2
    assert_select "tr>td", :text => "D1".to_s, :count => 2
    assert_select "tr>td", :text => "D2".to_s, :count => 2
    assert_select "tr>td", :text => "D3".to_s, :count => 2
    assert_select "tr>td", :text => "D4".to_s, :count => 2
    assert_select "tr>td", :text => "Dm1".to_s, :count => 2
    assert_select "tr>td", :text => "Dm2".to_s, :count => 2
    assert_select "tr>td", :text => "Am1".to_s, :count => 2
    assert_select "tr>td", :text => "Am2".to_s, :count => 2
    assert_select "tr>td", :text => "S1".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
