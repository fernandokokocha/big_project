require 'rails_helper'

RSpec.describe Admin::LeaguesController, :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/admin/leagues').to route_to('admin/leagues#index')
    end

    it 'routes to #new' do
      expect(:get => '/admin/leagues/new').to route_to('admin/leagues#new')
    end

    it 'routes to #show' do
      expect(:get => '/admin/leagues/1').to route_to('admin/leagues#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/admin/leagues/1/edit').to route_to('admin/leagues#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/admin/leagues').to route_to('admin/leagues#create')
    end

    it 'routes to #update' do
      expect(:put => '/admin/leagues/1').to route_to('admin/leagues#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/admin/leagues/1').to route_to('admin/leagues#destroy', :id => '1')
    end

  end
end
