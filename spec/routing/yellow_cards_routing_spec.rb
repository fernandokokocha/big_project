require "rails_helper"

RSpec.describe YellowCardsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/yellow_cards").to route_to("yellow_cards#index")
    end

    it "routes to #new" do
      expect(:get => "/yellow_cards/new").to route_to("yellow_cards#new")
    end

    it "routes to #show" do
      expect(:get => "/yellow_cards/1").to route_to("yellow_cards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/yellow_cards/1/edit").to route_to("yellow_cards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/yellow_cards").to route_to("yellow_cards#create")
    end

    it "routes to #update" do
      expect(:put => "/yellow_cards/1").to route_to("yellow_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/yellow_cards/1").to route_to("yellow_cards#destroy", :id => "1")
    end

  end
end
