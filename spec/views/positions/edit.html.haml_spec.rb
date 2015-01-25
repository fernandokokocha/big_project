require 'rails_helper'

RSpec.describe "positions/edit", :type => :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      :name => "MyString",
      :value => 1
    ))
  end

  it "renders the edit position form" do
    render

    assert_select "form[action=?][method=?]", position_path(@position), "post" do

      assert_select "input#position_name[name=?]", "position[name]"

      assert_select "input#position_value[name=?]", "position[value]"
    end
  end
end
