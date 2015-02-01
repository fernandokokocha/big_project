require 'rails_helper'

RSpec.describe "injury_descriptions/new", :type => :view do
  before(:each) do
    assign(:injury_description, InjuryDescription.new(
      :description => "MyString"
    ))
  end

  it "renders new injury_description form" do
    render

    assert_select "form[action=?][method=?]", injury_descriptions_path, "post" do

      assert_select "input#injury_description_description[name=?]", "injury_description[description]"
    end
  end
end
