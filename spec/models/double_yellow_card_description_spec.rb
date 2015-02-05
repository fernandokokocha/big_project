require 'rails_helper'

RSpec.describe DoubleYellowCardDescription, :type => :model do
  include Helpers

  it 'is valid enough if has capital X in description' do
    description = DoubleYellowCardDescription.new(:description => 'X')
    expect(description).to be_valid
  end
end
