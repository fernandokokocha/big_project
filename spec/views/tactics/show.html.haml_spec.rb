require 'rails_helper'

RSpec.describe "tactics/show", :type => :view do
  before(:each) do
    @tactic = assign(:tactic, Tactic.create!(
      :gk => "Gk",
      :d1 => "D1",
      :d2 => "D2",
      :d3 => "D3",
      :d4 => "D4",
      :dm1 => "Dm1",
      :dm2 => "Dm2",
      :am1 => "Am1",
      :am2 => "Am2",
      :s1 => "S1",
      :s2 => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Gk/)
    expect(rendered).to match(/D1/)
    expect(rendered).to match(/D2/)
    expect(rendered).to match(/D3/)
    expect(rendered).to match(/D4/)
    expect(rendered).to match(/Dm1/)
    expect(rendered).to match(/Dm2/)
    expect(rendered).to match(/Am1/)
    expect(rendered).to match(/Am2/)
    expect(rendered).to match(/S1/)
    expect(rendered).to match(/1/)
  end
end
