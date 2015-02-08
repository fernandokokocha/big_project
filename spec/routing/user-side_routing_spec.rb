require 'rails_helper'

RSpec.describe 'User-side routing', :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/teams').to route_to('teams#index')
    end

    it 'routes to #my_team' do
      expect(:get => '/my_team').to route_to('teams#my_team')
    end

    it 'routes to #players' do
      expect(:get => '/players').to route_to('teams#players')
    end

    it 'routes to #tactic' do
      expect(:get => '/tactic').to route_to('teams#tactic')
    end
    it 'routes to #stadium' do
      expect(:get => '/stadium').to route_to('teams#stadium')
    end
    it 'routes to #finance' do
      expect(:get => '/finance').to route_to('teams#finance')
    end

    it 'routes to #play_match' do
      expect(:get => '/play_match').to route_to('matches#play_match')
    end

    it 'routes to admin panel' do
      expect(:get => '/admin').to route_to('admin#index')
    end

  end
end
