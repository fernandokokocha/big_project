require 'rails_helper'

RSpec.describe "DoubleYellowCardDescriptions", :type => :request do
  describe "GET /double_yellow_card_descriptions" do
    it "works! (now write some real specs)" do
      get double_yellow_card_descriptions_path
      expect(response).to have_http_status(200)
    end
  end
end
