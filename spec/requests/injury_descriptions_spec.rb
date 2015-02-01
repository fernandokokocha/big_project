require 'rails_helper'

RSpec.describe "InjuryDescriptions", :type => :request do
  describe "GET /injury_descriptions" do
    it "works! (now write some real specs)" do
      get injury_descriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
