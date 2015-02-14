require 'rails_helper'

RSpec.describe Player, :type => :model do
  include Helpers

  before (:each) do
    @player = build(:player)
  end

  it 'puts full name properly' do
    expect(@player.full_name).to eq('First Last')
  end

  it 'calculates current age' do
    expect(@player.current_age).to eq(21)
  end

  it 'calculates positions powers' do
    expect(@player.gk_power).to eq(@player.handling + @player.reflex)
    expect(@player.d_power).to eq(@player.discipline + @player.tackling)
    expect(@player.dm_power).to eq(@player.work_rate + @player.positioning)
    expect(@player.am_power).to eq(@player.creativity + @player.technique)
    expect(@player.s_power).to eq(@player.instinct + @player.shots)
  end

  it 'chooses proper position power' do
    @player.position = build(:position, :name => 'GK')
    expect(@player.position_power).to eq(@player.handling + @player.reflex)
    @player.position = build(:position, :name => 'D')
    expect(@player.position_power).to eq(@player.discipline + @player.tackling)
    @player.position = build(:position, :name => 'DM')
    expect(@player.position_power).to eq(@player.work_rate + @player.positioning)
    @player.position = build(:position, :name => 'AM')
    expect(@player.position_power).to eq(@player.creativity + @player.technique)
    @player.position = build(:position, :name => 'S')
    expect(@player.position_power).to eq(@player.instinct + @player.shots)
  end

  it 'calculates rounded salary' do
    expect(@player.salary).not_to eq(0)
    expect(@player.salary % 100).to eq(0)
  end

  it 'calculates goals' do
    create(:match_event, :event_type => 'goal', :first_player => @player)
    create(:match_event, :event_type => 'goal', :first_player => @player)
    expect(@player.goals).to eq(2)
  end

  it 'calculates assists' do
    create(:match_event, :event_type => 'goal', :second_player => @player)
    create(:match_event, :event_type => 'goal', :second_player => @player)
    expect(@player.assists).to eq(2)
  end

  it 'calculates injuries' do
    create(:match_event, :event_type => 'injury', :first_player => @player)
    create(:match_event, :event_type => 'injury', :first_player => @player)
    create(:match_event, :event_type => 'injury', :first_player => @player)
    expect(@player.injuries).to eq(3)

  end

  it 'calculates yellow cards' do
    create(:match_event, :event_type => 'yellow card', :first_player => @player)
    create(:match_event, :event_type => 'yellow card', :first_player => @player)
    expect(@player.yellow_cards).to eq(2)
  end

  it 'calculates double yellow cards' do
    create(:match_event, :event_type => 'double yellow card', :first_player => @player)
    expect(@player.double_yellow_cards).to eq(1)
  end

  it 'calculates red cards' do
    create(:match_event, :event_type => 'red card', :first_player => @player)
    expect(@player.red_cards).to eq(1)
  end
end
