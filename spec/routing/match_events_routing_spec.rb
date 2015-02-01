require "rails_helper"

RSpec.describe MatchEventsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/match_events").to route_to("match_events#index")
    end

    it "routes to #new" do
      expect(:get => "/match_events/new").to route_to("match_events#new")
    end

    it "routes to #show" do
      expect(:get => "/match_events/1").to route_to("match_events#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/match_events/1/edit").to route_to("match_events#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/match_events").to route_to("match_events#create")
    end

    it "routes to #update" do
      expect(:put => "/match_events/1").to route_to("match_events#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/match_events/1").to route_to("match_events#destroy", :id => "1")
    end

  end
end
