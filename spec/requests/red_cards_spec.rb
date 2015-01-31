require 'rails_helper'

RSpec.describe "RedCards", :type => :request do
  describe "GET /red_cards" do
    it "works! (now write some real specs)" do
      get red_cards_path
      expect(response).to have_http_status(200)
    end
  end
end
