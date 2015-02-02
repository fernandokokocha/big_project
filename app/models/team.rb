class Team < ActiveRecord::Base
  has_many :players
  belongs_to :stadium
  belongs_to :user
  belongs_to :tactic

  mount_uploader :logo, TeamLogoUploader

  def to_s
    "#{name}(#{user.email})"
  end

  def defensive_power
    (tactic.gk.gk_power * 0.9 +
        tactic.d1.d_power * 0.9 +
        tactic.d2.d_power * 0.9 +
        tactic.d3.d_power * 0.9 +
        tactic.d4.d_power * 0.9 +
        tactic.dm1.dm_power * 0.6 +
        tactic.dm2.dm_power * 0.6 +
        tactic.am1.am_power * 0.4 +
        tactic.am2.am_power * 0.4 +
        tactic.s1.s_power * 0.1 +
        tactic.s2.s_power * 0.1).to_i
  end

  def offensive_power
    (tactic.gk.gk_power * 0.0 +
        tactic.d1.d_power * 0.2 +
        tactic.d2.d_power * 0.2 +
        tactic.d3.d_power * 0.2 +
        tactic.d4.d_power * 0.2 +
        tactic.dm1.dm_power * 0.8 +
        tactic.dm2.dm_power * 0.8 +
        tactic.am1.am_power * 1.2 +
        tactic.am2.am_power * 1.2 +
        tactic.s1.s_power * 1.8 +
        tactic.s2.s_power * 1.8).to_i
  end

  def logo_path
    if logo.present?
      logo
    else
      logo.default_url
    end
  end

  def logo_thumb_path
    if logo.present?
      logo.thumb
    else
      logo.default_thumb_url
    end
  end

  def logo_micro_path
    if logo.present?
      logo.micro
    else
      logo.default_micro_url
    end
  end
end
