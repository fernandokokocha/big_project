class Team < ActiveRecord::Base
  has_many :players
  belongs_to :stadium
  belongs_to :user
  belongs_to :tactic

  mount_uploader :logo, TeamLogoUploader

  def defensive_power
    Player.find(tactic.gk).gk_power * 0.9 +
      Player.find(tactic.d1).d_power * 0.9 +
      Player.find(tactic.d2).d_power * 0.9 +
      Player.find(tactic.d3).d_power * 0.9 +
      Player.find(tactic.d4).d_power * 0.9 +
      Player.find(tactic.dm1).dm_power * 0.6 +
      Player.find(tactic.dm2).dm_power * 0.6 +
      Player.find(tactic.am1).am_power * 0.4 +
      Player.find(tactic.am2).am_power * 0.4 +
      Player.find(tactic.s1).s_power * 0.1 +
      Player.find(tactic.s2).s_power * 0.1
  end

  def offensive_power
    Player.find(tactic.gk).gk_power * 0.1 +
        Player.find(tactic.d1).d_power * 0.1 +
        Player.find(tactic.d2).d_power * 0.1 +
        Player.find(tactic.d3).d_power * 0.1 +
        Player.find(tactic.d4).d_power * 0.1 +
        Player.find(tactic.dm1).dm_power * 0.4 +
        Player.find(tactic.dm2).dm_power * 0.4 +
        Player.find(tactic.am1).am_power * 0.6 +
        Player.find(tactic.am2).am_power * 0.6 +
        Player.find(tactic.s1).s_power * 0.9 +
        Player.find(tactic.s2).s_power * 0.9
  end
end
