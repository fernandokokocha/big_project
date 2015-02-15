require 'rails_helper'

RSpec.describe Team, :type => :model do
  include Helpers

  before (:each) do
    user = build(:user, :email => 'user@example.com')

    @team = create(:team,
                  :name => 'Team-name',
                  :user => user)
  end

  it 'prints nicely' do
    expect(@team.to_s).to eq('Team-name (user@example.com)')
  end

  it 'has default logo paths' do
    expect(@team.logo_path).to eq('default_logo.jpg')
    expect(@team.logo_thumb_path).to eq('default_logo_thumb.jpg')
    expect(@team.logo_micro_path).to eq('default_logo_micro.jpg')
  end

  context 'some matches played' do
    before (:each) do
      @rival = create(:team, :name => 'Rival')

      create(:match, :home => @team, :away => @rival, :home_score => 2, :away_score => 1)
      create(:match, :home => @rival, :away => @team, :home_score => 4, :away_score => 1)
      create(:match, :home => @rival, :away => @team, :home_score => 0, :away_score => 0)
      create(:match, :home => @team, :away => @rival, :home_score => 0, :away_score => 0)
    end

    it 'calculates goals for' do
      expect(@team.goals_for).to eq(3)
    end

    it 'calculates goals against' do
      expect(@team.goals_against).to eq(5)
    end

    it 'calculates goals diff' do
      expect(@team.goals_diff).to eq(-2)
    end

    it 'calculates points' do
      expect(@team.points).to eq(5)
    end

    it 'calculates wins' do
      expect(@team.wins).to eq(1)
    end

    it 'calculates losts' do
      expect(@team.losts).to eq(1)
    end

    it 'calculates draws' do
      expect(@team.draws).to eq(2)
    end

    it 'calculates matches' do
      expect(@team.matches).to eq(4)
    end
  end

  it 'knows last matches' do
    matches = []
    matches << create(:match, :home => @team, :date => 1.day.ago)
    matches << create(:match, :home => @team, :date => 2.days.ago)
    matches << create(:match, :away => @team, :date => 3.days.ago)
    matches << create(:match, :away => @team, :date => 4.days.ago)
    matches << create(:match, :home => @team, :date => 5.days.ago)
    matches << create(:match, :away => @team, :date => 6.days.ago)

    matches.pop
    expect(@team.last_matches).to eq(matches)
  end
end
