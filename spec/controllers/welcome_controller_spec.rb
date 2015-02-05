require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe 'when not logged in' do
    it 'renders welcome page' do
      sign_in nil
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'when logged in' do
    it 'redirects to my team path' do
      sign_in
      get :index
      expect(response).to redirect_to(my_team_path)
    end
  end

end
