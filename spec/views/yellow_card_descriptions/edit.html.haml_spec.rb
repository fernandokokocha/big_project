require 'rails_helper'

RSpec.describe "yellow_card_descriptions/edit", :type => :view do
  before(:each) do
    @yellow_card_description = assign(:yellow_card_description, YellowCardDescription.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit yellow_card_description form" do
    render

    assert_select "form[action=?][method=?]", yellow_card_description_path(@yellow_card_description), "post" do

      assert_select "input#yellow_card_description_description[name=?]", "yellow_card_description[description]"
    end
  end
end
