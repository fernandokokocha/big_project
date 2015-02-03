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
end
