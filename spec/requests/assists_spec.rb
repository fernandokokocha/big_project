require 'rails_helper'

RSpec.describe "Assists", :type => :request do
  describe "GET /assists" do
    it "works! (now write some real specs)" do
      get assists_path
      expect(response).to have_http_status(200)
    end
  end
end
