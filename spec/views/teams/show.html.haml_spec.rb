require 'rails_helper'

RSpec.describe 'teams/show', :type => :view do
  before(:each) do
    @team = build(:team)
    assign(:team, @team)
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  it 'renders overview' do
    sign_in @team.user
    render
    assert_select 'img#team-logo'
    assert_select 'h1', /#{@team.name}/ do
      assert_select '.small', @team.user.email
    end
    assert_select 'p', /Stadium/
    assert_select 'p', /Players/
  end
end
