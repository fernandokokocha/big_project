require 'rails_helper'

RSpec.describe DoubleYellowCardDescriptionsController, :type => :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/double_yellow_card_descriptions').to route_to('double_yellow_card_descriptions#index')
    end

    it 'routes to #new' do
      expect(:get => '/double_yellow_card_descriptions/new').to route_to('double_yellow_card_descriptions#new')
    end

    it 'routes to #show' do
      expect(:get => '/double_yellow_card_descriptions/1').to route_to('double_yellow_card_descriptions#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/double_yellow_card_descriptions/1/edit').to route_to('double_yellow_card_descriptions#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/double_yellow_card_descriptions').to route_to('double_yellow_card_descriptions#create')
    end

    it 'routes to #update' do
      expect(:put => '/double_yellow_card_descriptions/1').to route_to('double_yellow_card_descriptions#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/double_yellow_card_descriptions/1').to route_to('double_yellow_card_descriptions#destroy', :id => '1')
    end

  end
end
