require 'rails_helper'

RSpec.describe Admin::GoalDescriptionsController, :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => 'admin/goal_descriptions').to route_to('admin/goal_descriptions#index')
    end

    it 'routes to #new' do
      expect(:get => 'admin/goal_descriptions/new').to route_to('admin/goal_descriptions#new')
    end

    it 'routes to #show' do
      expect(:get => 'admin/goal_descriptions/1').to route_to('admin/goal_descriptions#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => 'admin/goal_descriptions/1/edit').to route_to('admin/goal_descriptions#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => 'admin/goal_descriptions').to route_to('admin/goal_descriptions#create')
    end

    it 'routes to #update' do
      expect(:put => 'admin/goal_descriptions/1').to route_to('admin/goal_descriptions#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => 'admin/goal_descriptions/1').to route_to('admin/goal_descriptions#destroy', :id => '1')
    end

  end
end
