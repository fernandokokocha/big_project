require 'rails_helper'

RSpec.describe "injuries/index", :type => :view do
  before(:each) do
    assign(:injuries, [
      Injury.create!(),
      Injury.create!()
    ])
  end

  it "renders a list of injuries" do
    render
  end
end
