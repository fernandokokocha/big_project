require 'rails_helper'

RSpec.describe "injury_descriptions/show", :type => :view do
  before(:each) do
    @injury_description = assign(:injury_description, InjuryDescription.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
