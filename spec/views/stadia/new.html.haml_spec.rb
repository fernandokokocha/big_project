require 'rails_helper'

RSpec.describe "stadia/new", :type => :view do
  before(:each) do
    assign(:stadium, Stadium.new(
      :name => "MyString",
      :capacity => 1,
      :roof => false
    ))
  end

  it "renders new stadium form" do
    render

    assert_select "form[action=?][method=?]", stadia_path, "post" do

      assert_select "input#stadium_name[name=?]", "stadium[name]"

      assert_select "input#stadium_capacity[name=?]", "stadium[capacity]"

      assert_select "input#stadium_roof[name=?]", "stadium[roof]"
    end
  end
end
