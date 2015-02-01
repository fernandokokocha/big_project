require "rails_helper"

RSpec.describe GoalDescriptionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/goal_descriptions").to route_to("goal_descriptions#index")
    end

    it "routes to #new" do
      expect(:get => "/goal_descriptions/new").to route_to("goal_descriptions#new")
    end

    it "routes to #show" do
      expect(:get => "/goal_descriptions/1").to route_to("goal_descriptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/goal_descriptions/1/edit").to route_to("goal_descriptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/goal_descriptions").to route_to("goal_descriptions#create")
    end

    it "routes to #update" do
      expect(:put => "/goal_descriptions/1").to route_to("goal_descriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/goal_descriptions/1").to route_to("goal_descriptions#destroy", :id => "1")
    end

  end
end
