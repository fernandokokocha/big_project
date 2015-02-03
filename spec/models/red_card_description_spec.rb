require 'rails_helper'

RSpec.describe RedCardDescription, :type => :model do
  include Helpers

  it "is invalid without a description" do
    description = RedCardDescription.new
    expect(description).not_to be_valid
  end

  it "is invalid without capital X in description" do
    description = RedCardDescription.new(:description => alphabet_without_X)
    expect(description).not_to be_valid
  end

  it "is valid enough if has capital X in description" do
    description = RedCardDescription.new(:description => "X")
    expect(description).to be_valid
  end
end
