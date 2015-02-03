require 'rails_helper'

RSpec.describe InjuryDescription, :type => :model do
  include Helpers

  it "is invalid without a description" do
    description = InjuryDescription.new
    expect(description).not_to be_valid
  end

  it "is invalid without capital X in description" do
    description = InjuryDescription.new(:description => alphabet_without_X)
    expect(description).not_to be_valid
  end

  it "is valid enough if has capital X in description" do
    description = InjuryDescription.new(:description => "X")
    expect(description).to be_valid
  end
end
