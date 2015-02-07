require 'rails_helper'

RSpec.describe 'teams/index', :type => :view do
  before (:each) do
    @user = build(:user)
    @user2 = build(:user)
    @team1 = build(:team, user: @user)
    @team2 = build(:team, user: @user2, name: 'FC User 2')
    assign(:teams, [@team1, @team2])
  end

  it 'renders a list of teams' do
    render
    assert_select 'h1', 'Listing teams'
    assert_select 'table.table' do
      assert_select 'tr' do
        assert_select 'td', :text => @team1.name
        assert_select 'td', :text => @user.email
      end
      assert_select 'tr' do
        assert_select 'td', :text => @team2.name
        assert_select 'td', :text => @user2.email
      end
    end
  end
end
