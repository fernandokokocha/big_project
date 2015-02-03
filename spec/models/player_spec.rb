require 'rails_helper'

RSpec.describe Player, :type => :model do
  include Helpers

  it 'puts full name properly' do
    player = get_player
    expect(player.full_name).to eq('First Last')
  end

  it 'calculates current age' do
    player = get_player
    expect(player.current_age).to eq(21)
  end

  it 'calculates positions powers' do
    player = get_player
    expect(player.gk_power).to eq(player.handling + player.reflex)
    expect(player.d_power).to eq(player.discipline + player.tackling)
    expect(player.dm_power).to eq(player.work_rate + player.positioning)
    expect(player.am_power).to eq(player.creativity + player.technique)
    expect(player.s_power).to eq(player.instinct + player.shots)
  end

  it 'choses proper position power' do
    player = get_player
    player.position = gk_position
    expect(player.position_power).to eq(player.handling + player.reflex)
    player.position = d_position
    expect(player.position_power).to eq(player.discipline + player.tackling)
    player.position = dm_position
    expect(player.position_power).to eq(player.work_rate + player.positioning)
    player.position = am_position
    expect(player.position_power).to eq(player.creativity + player.technique)
    player.position = s_position
    expect(player.position_power).to eq(player.instinct + player.shots)
  end

  def get_player
    Player.new(:first_name => 'First',
               :last_name => 'Last',
               :handling => 1,
               :reflex => 2,
               :discipline => 3,
               :tackling => 4,
               :work_rate => 5,
               :positioning => 6,
               :creativity => 7,
               :technique => 8,
               :instinct => 9,
               :shots => 10,
               :birthdate => Date.today - 21.years)
  end
end
