require 'rails_helper'

RSpec.describe "double_yellow_card_descriptions/new", :type => :view do
  before(:each) do
    assign(:double_yellow_card_description, DoubleYellowCardDescription.new(
      :description => "MyString"
    ))
  end

  it "renders new double_yellow_card_description form" do
    render

    assert_select "form[action=?][method=?]", double_yellow_card_descriptions_path, "post" do

      assert_select "input#double_yellow_card_description_description[name=?]", "double_yellow_card_description[description]"
    end
  end
end
