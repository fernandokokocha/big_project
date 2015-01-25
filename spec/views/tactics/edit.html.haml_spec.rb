require 'rails_helper'

RSpec.describe "tactics/edit", :type => :view do
  before(:each) do
    @tactic = assign(:tactic, Tactic.create!(
      :gk => "MyString",
      :d1 => "MyString",
      :d2 => "MyString",
      :d3 => "MyString",
      :d4 => "MyString",
      :dm1 => "MyString",
      :dm2 => "MyString",
      :am1 => "MyString",
      :am2 => "MyString",
      :s1 => "MyString",
      :s2 => 1
    ))
  end

  it "renders the edit tactic form" do
    render

    assert_select "form[action=?][method=?]", tactic_path(@tactic), "post" do

      assert_select "input#tactic_gk[name=?]", "tactic[gk]"

      assert_select "input#tactic_d1[name=?]", "tactic[d1]"

      assert_select "input#tactic_d2[name=?]", "tactic[d2]"

      assert_select "input#tactic_d3[name=?]", "tactic[d3]"

      assert_select "input#tactic_d4[name=?]", "tactic[d4]"

      assert_select "input#tactic_dm1[name=?]", "tactic[dm1]"

      assert_select "input#tactic_dm2[name=?]", "tactic[dm2]"

      assert_select "input#tactic_am1[name=?]", "tactic[am1]"

      assert_select "input#tactic_am2[name=?]", "tactic[am2]"

      assert_select "input#tactic_s1[name=?]", "tactic[s1]"

      assert_select "input#tactic_s2[name=?]", "tactic[s2]"
    end
  end
end
