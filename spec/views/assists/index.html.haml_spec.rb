require 'rails_helper'

RSpec.describe "assists/index", :type => :view do
  before(:each) do
    assign(:assists, [
      Assist.create!(),
      Assist.create!()
    ])
  end

  it "renders a list of assists" do
    render
  end
end
