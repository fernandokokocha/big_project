require 'rails_helper'

RSpec.describe "assists/edit", :type => :view do
  before(:each) do
    @assist = assign(:assist, Assist.create!())
  end

  it "renders the edit assist form" do
    render

    assert_select "form[action=?][method=?]", assist_path(@assist), "post" do
    end
  end
end
