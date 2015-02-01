require 'rails_helper'

RSpec.describe "red_card_descriptions/edit", :type => :view do
  before(:each) do
    @red_card_description = assign(:red_card_description, RedCardDescription.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit red_card_description form" do
    render

    assert_select "form[action=?][method=?]", red_card_description_path(@red_card_description), "post" do

      assert_select "input#red_card_description_description[name=?]", "red_card_description[description]"
    end
  end
end
