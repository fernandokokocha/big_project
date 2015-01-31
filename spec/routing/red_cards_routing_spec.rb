require "rails_helper"

RSpec.describe RedCardsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/red_cards").to route_to("red_cards#index")
    end

    it "routes to #new" do
      expect(:get => "/red_cards/new").to route_to("red_cards#new")
    end

    it "routes to #show" do
      expect(:get => "/red_cards/1").to route_to("red_cards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/red_cards/1/edit").to route_to("red_cards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/red_cards").to route_to("red_cards#create")
    end

    it "routes to #update" do
      expect(:put => "/red_cards/1").to route_to("red_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/red_cards/1").to route_to("red_cards#destroy", :id => "1")
    end

  end
end
