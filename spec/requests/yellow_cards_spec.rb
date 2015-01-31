require 'rails_helper'

RSpec.describe "YellowCards", :type => :request do
  describe "GET /yellow_cards" do
    it "works! (now write some real specs)" do
      get yellow_cards_path
      expect(response).to have_http_status(200)
    end
  end
end
