require 'rails_helper'

RSpec.describe "injury_descriptions/edit", :type => :view do
  before(:each) do
    @injury_description = assign(:injury_description, InjuryDescription.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit injury_description form" do
    render

    assert_select "form[action=?][method=?]", injury_description_path(@injury_description), "post" do

      assert_select "input#injury_description_description[name=?]", "injury_description[description]"
    end
  end
end
