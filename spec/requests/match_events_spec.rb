require 'rails_helper'

RSpec.describe "MatchEvents", :type => :request do
  describe "GET /match_events" do
    it "works! (now write some real specs)" do
      get match_events_path
      expect(response).to have_http_status(200)
    end
  end
end
