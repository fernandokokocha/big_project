require 'rails_helper'

RSpec.describe "YellowCardDescriptions", :type => :request do
  describe "GET /yellow_card_descriptions" do
    it "works! (now write some real specs)" do
      get yellow_card_descriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
