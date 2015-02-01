require 'rails_helper'

RSpec.describe "double_yellow_card_descriptions/edit", :type => :view do
  before(:each) do
    @double_yellow_card_description = assign(:double_yellow_card_description, DoubleYellowCardDescription.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit double_yellow_card_description form" do
    render

    assert_select "form[action=?][method=?]", double_yellow_card_description_path(@double_yellow_card_description), "post" do

      assert_select "input#double_yellow_card_description_description[name=?]", "double_yellow_card_description[description]"
    end
  end
end
