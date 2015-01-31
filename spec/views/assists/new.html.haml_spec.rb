require 'rails_helper'

RSpec.describe "assists/new", :type => :view do
  before(:each) do
    assign(:assist, Assist.new())
  end

  it "renders new assist form" do
    render

    assert_select "form[action=?][method=?]", assists_path, "post" do
    end
  end
end
