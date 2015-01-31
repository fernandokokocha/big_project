require 'rails_helper'

RSpec.describe "Injuries", :type => :request do
  describe "GET /injuries" do
    it "works! (now write some real specs)" do
      get injuries_path
      expect(response).to have_http_status(200)
    end
  end
end
