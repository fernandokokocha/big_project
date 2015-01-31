require "rails_helper"

RSpec.describe AssistsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/assists").to route_to("assists#index")
    end

    it "routes to #new" do
      expect(:get => "/assists/new").to route_to("assists#new")
    end

    it "routes to #show" do
      expect(:get => "/assists/1").to route_to("assists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/assists/1/edit").to route_to("assists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/assists").to route_to("assists#create")
    end

    it "routes to #update" do
      expect(:put => "/assists/1").to route_to("assists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/assists/1").to route_to("assists#destroy", :id => "1")
    end

  end
end
