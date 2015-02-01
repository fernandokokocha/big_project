require 'rails_helper'

RSpec.describe "injury_descriptions/index", :type => :view do
  before(:each) do
    assign(:injury_descriptions, [
      InjuryDescription.create!(
        :description => "Description"
      ),
      InjuryDescription.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of injury_descriptions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
