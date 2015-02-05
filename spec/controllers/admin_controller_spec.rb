require 'rails_helper'

RSpec.describe AdminController, :type => :controller do

  before (:suite) do
    FactoryGirl.lint
  end

  describe 'when not admin' do
    it 'redirects to root' do
      user = build(:user)
      sign_in user
      get :index
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'when admin' do
    it 'renders admin panel' do
      admin = build(:admin)
      sign_in admin
      get :index
      expect(response).to render_template('index')
    end
  end

end
