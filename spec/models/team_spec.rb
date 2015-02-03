require 'rails_helper'

RSpec.describe Team, :type => :model do
  include Helpers

  before (:each) do
    user = User.new(:email => 'user@example.com')

    @team = Team.new(:name => 'Team-name',
                     :user => user)
  end

  it 'prints nicely' do
    expect(@team.to_s).to eq('Team-name (user@example.com)')
  end

  it 'has default logo paths' do
    expect(@team.logo_path).to eq('default_logo.jpg')
    expect(@team.logo_thumb_path).to eq('default_logo_thumb.jpg')
    expect(@team.logo_micro_path).to eq('default_logo_micro.jpg')
  end
end
