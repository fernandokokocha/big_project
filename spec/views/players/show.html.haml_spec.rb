require 'rails_helper'

RSpec.describe "players/show", :type => :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :position => "Position",
      :salary => 1,
      :reflex => 2,
      :handling => 3,
      :discipline => 4,
      :tackling => 5,
      :work_rate => 6,
      :positioning => 7,
      :creativity => 8,
      :technique => 9,
      :instinct => 10,
      :shots => 11,
      :condition => 12
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
  end
end
