require 'rails_helper'

RSpec.describe "assists/show", :type => :view do
  before(:each) do
    @assist = assign(:assist, Assist.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
