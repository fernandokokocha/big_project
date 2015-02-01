require 'rails_helper'

RSpec.describe "red_card_descriptions/new", :type => :view do
  before(:each) do
    assign(:red_card_description, RedCardDescription.new(
      :description => "MyString"
    ))
  end

  it "renders new red_card_description form" do
    render

    assert_select "form[action=?][method=?]", red_card_descriptions_path, "post" do

      assert_select "input#red_card_description_description[name=?]", "red_card_description[description]"
    end
  end
end
