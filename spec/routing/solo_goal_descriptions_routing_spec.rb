require 'rails_helper'

RSpec.describe SoloGoalDescriptionsController, :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/solo_goal_descriptions').to route_to('solo_goal_descriptions#index')
    end

    it 'routes to #new' do
      expect(:get => '/solo_goal_descriptions/new').to route_to('solo_goal_descriptions#new')
    end

    it 'routes to #show' do
      expect(:get => '/solo_goal_descriptions/1').to route_to('solo_goal_descriptions#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/solo_goal_descriptions/1/edit').to route_to('solo_goal_descriptions#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/solo_goal_descriptions').to route_to('solo_goal_descriptions#create')
    end

    it 'routes to #update' do
      expect(:put => '/solo_goal_descriptions/1').to route_to('solo_goal_descriptions#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/solo_goal_descriptions/1').to route_to('solo_goal_descriptions#destroy', :id => '1')
    end

  end
end
