class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :position

  def full_name
    first_name + ' ' + last_name
  end

  def current_age
    now = Time.now.utc.to_date
    now.year - birthdate.year - (birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def gk_power
    reflex + handling
  end

  def d_power
    discipline + tackling
  end

  def dm_power
    work_rate + positioning
  end

  def am_power
    creativity + technique
  end

  def s_power
    instinct + shots
  end

  def position_power
    case position.name
      when 'GK'
        gk_power
      when 'D'
        d_power
      when 'DM'
        dm_power
      when 'AM'
        am_power
      when 'S'
        s_power
      else
        'LOL'
    end
  end
end
