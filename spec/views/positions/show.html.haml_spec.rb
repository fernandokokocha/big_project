require 'rails_helper'

RSpec.describe "positions/show", :type => :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      :name => "Name",
      :value => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
