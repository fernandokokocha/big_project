require 'rails_helper'

RSpec.describe "stadia/edit", :type => :view do
  before(:each) do
    @stadium = assign(:stadium, Stadium.create!(
      :name => "MyString",
      :capacity => 1,
      :roof => false
    ))
  end

  it "renders the edit stadium form" do
    render

    assert_select "form[action=?][method=?]", stadium_path(@stadium), "post" do

      assert_select "input#stadium_name[name=?]", "stadium[name]"

      assert_select "input#stadium_capacity[name=?]", "stadium[capacity]"

      assert_select "input#stadium_roof[name=?]", "stadium[roof]"
    end
  end
end
