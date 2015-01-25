require 'rails_helper'

RSpec.describe "stadia/show", :type => :view do
  before(:each) do
    @stadium = assign(:stadium, Stadium.create!(
      :name => "Name",
      :capacity => 1,
      :roof => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
