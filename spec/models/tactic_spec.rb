require 'rails_helper'

RSpec.describe Tactic, :type => :model do
  include Helpers

  before (:each) do
    gk = Player.new(:position => gk_position,
                    :reflex => 10,
                    :handling => 10)
    d1 = Player.new(:position => d_position,
                    :discipline => 10,
                    :tackling => 10)
    d2 = Player.new(:position => d_position,
                    :discipline => 10,
                    :tackling => 10)
    d3 = Player.new(:position => d_position,
                    :discipline => 10,
                    :tackling => 10)
    d4 = Player.new(:position => d_position,
                    :discipline => 10,
                    :tackling => 10)
    dm1 = Player.new(:position => dm_position,
                     :work_rate => 10,
                     :positioning => 10)
    dm2 = Player.new(:position => dm_position,
                     :work_rate => 10,
                     :positioning => 10)
    am1 = Player.new(:position => am_position,
                     :creativity => 10,
                     :technique => 10)
    am2 = Player.new(:position => am_position,
                     :creativity => 10,
                     :technique => 10)
    s1 = Player.new(:position => s_position,
                    :instinct => 10,
                    :shots => 10)
    s2 = Player.new(:position => s_position,
                    :instinct => 10,
                    :shots => 10)

    @tactic = Tactic.new(:gk => gk,
                         :d1 => d1,
                         :d2 => d2,
                         :d3 => d3,
                         :d4 => d4,
                         :dm1 => dm1,
                         :dm2 => dm2,
                         :am1 => am1,
                         :am2 => am2,
                         :s1 => s1,
                         :s2 => s2)

    @field_players = [d1, d2, d3, d4, dm1, dm2, am1, am2, s1, s2]
    @players = [gk] + @field_players
  end

  it 'knows which players are included' do
    @players.each do |player|
      expect(@tactic.include? player).to be true
    end
  end

  it 'knows which players are not included' do
    player_not_included = Player.new
    expect(@tactic.include? player_not_included).to be false
  end

  it 'selects all players' do
    expect(@tactic.all_players).to eq(@players)
  end

  it 'selects all field players' do
    expect(@tactic.all_field_players).to eq(@field_players)
  end

  it 'calculates defensive power' do
    expect(@tactic.defensive_power).to eq(2*(1*9 + 4*9 + 2*6 + 2*4 + 2*1))
  end

  it 'calculates offensive power' do
    expect(@tactic.offensive_power).to eq(2*(1*0 + 4*2 + 2*8 + 2*12 + 2*18))
  end
end
