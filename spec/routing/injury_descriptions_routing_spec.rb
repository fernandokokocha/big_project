require 'rails_helper'

RSpec.describe InjuryDescriptionsController, :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/injury_descriptions').to route_to('injury_descriptions#index')
    end

    it 'routes to #new' do
      expect(:get => '/injury_descriptions/new').to route_to('injury_descriptions#new')
    end

    it 'routes to #show' do
      expect(:get => '/injury_descriptions/1').to route_to('injury_descriptions#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/injury_descriptions/1/edit').to route_to('injury_descriptions#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/injury_descriptions').to route_to('injury_descriptions#create')
    end

    it 'routes to #update' do
      expect(:put => '/injury_descriptions/1').to route_to('injury_descriptions#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/injury_descriptions/1').to route_to('injury_descriptions#destroy', :id => '1')
    end

  end
end
