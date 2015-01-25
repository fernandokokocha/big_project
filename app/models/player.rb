class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :position

  def current_age
    ((Date.today - birthdate)/365.25).to_i
  end

  def gk_power
    reflex + handling
  end

  def d_power
    discipline + tackling
  end

  def dm_power
    work_rate + position
  end

  def am_power
    creativity + technique
  end

  def s_power
    instinct + shots
  end
end
