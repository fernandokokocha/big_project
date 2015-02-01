class Tactic < ActiveRecord::Base
  has_one :team

  def include? player
    attributes.each do |key, value|
      return true if value == player.id
    end
    false
  end

  def all_players
    result = []
    result << Player.find(gk)
    result << Player.find(d4)
    result << Player.find(d3)
    result << Player.find(d2)
    result << Player.find(d1)
    result << Player.find(dm1)
    result << Player.find(dm2)
    result << Player.find(am2)
    result << Player.find(am1)
    result << Player.find(s2)
    result << Player.find(s1)

    result
  end
end
