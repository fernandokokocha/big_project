require 'rails_helper'

RSpec.describe "RedCardDescriptions", :type => :request do
  describe "GET /red_card_descriptions" do
    it "works! (now write some real specs)" do
      get red_card_descriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
