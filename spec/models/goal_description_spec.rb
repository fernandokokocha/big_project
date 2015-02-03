require 'rails_helper'

RSpec.describe GoalDescription, :type => :model do
  include Helpers

  it "is invalid without a description" do
    description = GoalDescription.new
    expect(description).not_to be_valid
  end

  it "is invalid without capital X in description" do
    description = GoalDescription.new(:description => alphabet_without_X)
    expect(description).not_to be_valid
  end

  it "is invalid without capital X in description" do
    description = GoalDescription.new(:description => alphabet_without_Y)
    expect(description).not_to be_valid
  end

  it "is valid enough if has capital X in description" do
    description = GoalDescription.new(:description => "Y X")
    expect(description).to be_valid
  end
end
