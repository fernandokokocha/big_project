require 'rails_helper'

RSpec.describe 'teams/show', :type => :view do
  before(:each) do
    @other_user = build(:user)
    @team = build(:team)
    assign(:team, @team)
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  it 'renders more when my_team' do
    sign_in @team.user
    render
    assert_select 'img#team-logo'
    assert_select 'h1', /#{@team.name}/ do
      assert_select '.small', @team.user.email
    end
    assert_select 'p', /Balance/
    assert_select 'p', /Stadium/ do
    end
  end

  it 'renders less when not my_team' do
    sign_in @other_user
    render
    assert_select 'img#team-logo'
    assert_select 'h1', /#{@team.name}/ do
      assert_select '.small', @team.user.email
    end
    assert_select 'p', {count: 0, text: /Balance/}
    assert_select 'p', /Stadium/ do
    end
  end
end
