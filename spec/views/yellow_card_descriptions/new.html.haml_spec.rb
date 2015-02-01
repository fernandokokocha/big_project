require 'rails_helper'

RSpec.describe "yellow_card_descriptions/new", :type => :view do
  before(:each) do
    assign(:yellow_card_description, YellowCardDescription.new(
      :description => "MyString"
    ))
  end

  it "renders new yellow_card_description form" do
    render

    assert_select "form[action=?][method=?]", yellow_card_descriptions_path, "post" do

      assert_select "input#yellow_card_description_description[name=?]", "yellow_card_description[description]"
    end
  end
end
