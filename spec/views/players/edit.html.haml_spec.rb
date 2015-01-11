require 'rails_helper'

RSpec.describe "players/edit", :type => :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :position => "MyString",
      :salary => 1,
      :reflex => 1,
      :handling => 1,
      :discipline => 1,
      :tackling => 1,
      :work_rate => 1,
      :positioning => 1,
      :creativity => 1,
      :technique => 1,
      :instinct => 1,
      :shots => 1,
      :condition => 1
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "input#player_first_name[name=?]", "player[first_name]"

      assert_select "input#player_last_name[name=?]", "player[last_name]"

      assert_select "input#player_position[name=?]", "player[position]"

      assert_select "input#player_salary[name=?]", "player[salary]"

      assert_select "input#player_reflex[name=?]", "player[reflex]"

      assert_select "input#player_handling[name=?]", "player[handling]"

      assert_select "input#player_discipline[name=?]", "player[discipline]"

      assert_select "input#player_tackling[name=?]", "player[tackling]"

      assert_select "input#player_work_rate[name=?]", "player[work_rate]"

      assert_select "input#player_positioning[name=?]", "player[positioning]"

      assert_select "input#player_creativity[name=?]", "player[creativity]"

      assert_select "input#player_technique[name=?]", "player[technique]"

      assert_select "input#player_instinct[name=?]", "player[instinct]"

      assert_select "input#player_shots[name=?]", "player[shots]"

      assert_select "input#player_condition[name=?]", "player[condition]"
    end
  end
end
