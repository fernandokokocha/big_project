require 'devise'
require 'factory_girl'
require 'database_cleaner'

module ControllerHelpers
  def sign_in(user = double('user'))
    allow_message_expectations_on_nil
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Devise::TestHelpers, :type => :controller
  config.include Devise::TestHelpers, :type => :view
  config.include ControllerHelpers, :type => :controller
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end


module Helpers
  def alphabet_without_X
    'abcdefghijklmnoprstuwxyzABCDEFGHIJKLMNOPRSTUWYZ'
  end

  def alphabet_without_Y
    'abcdefghijklmnoprstuwxyzABCDEFGHIJKLMNOPRSTUWXZ'
  end

  def gk_position
    Position.new(:name => 'GK')
  end

  def d_position
    Position.new(:name => 'D')
  end

  def dm_position
    Position.new(:name => 'DM')
  end

  def am_position
    Position.new(:name => 'AM')
  end

  def s_position
    Position.new(:name => 'S')
  end
end