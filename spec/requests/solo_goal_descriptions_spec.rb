require 'rails_helper'

RSpec.describe "SoloGoalDescriptions", :type => :request do
  describe "GET /solo_goal_descriptions" do
    it "works! (now write some real specs)" do
      get solo_goal_descriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
