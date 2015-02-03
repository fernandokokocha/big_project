require 'rails_helper'

RSpec.describe 'User-side routing', :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/teams').to route_to('teams#index')
    end
    it 'routes to #index' do
      expect(:get => '/my_team').to route_to('teams#my_team')
    end

    it 'routes to #new' do
      expect(:get => '/play_match').to route_to('matches#play_match')
    end

  end
end
