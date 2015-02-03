require 'rails_helper'

RSpec.describe Tactic, :type => :model do
  before (:each) do
    @gk = Player.new(:position => gk_position)
    @d1 = Player.new(:position => d_position)
    @d2 = Player.new(:position => d_position)
    @d3 = Player.new(:position => d_position)
    @d4 = Player.new(:position => d_position)
    @dm1 = Player.new(:position => dm_position)
    @dm2 = Player.new(:position => dm_position)
    @am1 = Player.new(:position => am_position)
    @am2 = Player.new(:position => am_position)
    @s1 = Player.new(:position => s_position)
    @s2 = Player.new(:position => s_position)

    @tactic = Tactic.new(:gk => @gk,
                         :d1 => @d1,
                         :d2 => @d2,
                         :d3 => @d3,
                         :d4 => @d4,
                         :dm1 => @dm1,
                         :dm2 => @dm2,
                         :am1 => @am1,
                         :am2 => @am2,
                         :s1 => @s1,
                         :s2 => @s2)

    @field_players = [@d1, @d2, @d3, @d4, @dm1, @dm2, @am1, @am2, @s1, @s2]
    @players = [@gk] + @field_players
  end

  it "knows which players are included" do
    @players.each do |player|
      expect(@tactic.include? player).to be true
    end
  end

  it "knows which players are not included" do
    player_not_included = Player.new
    expect(@tactic.include? player_not_included).to be false
  end

  it "selects all players" do
    expect(@tactic.all_players).to eq(@players)
  end

  it "selects all field players" do
    expect(@tactic.all_field_players).to eq(@field_players)
  end

  def gk_position
    Position.new(:name => "GK")
  end

  def d_position
    Position.new(:name => "D")
  end

  def dm_position
    Position.new(:name => "DM")
  end

  def am_position
    Position.new(:name => "AM")
  end

  def s_position
    Position.new(:name => "S")
  end
end
