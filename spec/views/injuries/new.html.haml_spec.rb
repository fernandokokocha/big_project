require 'rails_helper'

RSpec.describe "injuries/new", :type => :view do
  before(:each) do
    assign(:injury, Injury.new())
  end

  it "renders new injury form" do
    render

    assert_select "form[action=?][method=?]", injuries_path, "post" do
    end
  end
end
