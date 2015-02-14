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
  
  def salary
    (handling +
        reflex +
        discipline +
        tackling +
        work_rate +
        positioning +
        creativity +
        technique +
        instinct +
        shots +
        condition).round(-2)
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

  def goals
    MatchEvent.where(:event_type => 'goal', :first_player => self).count
  end

  def assists
    MatchEvent.where(:event_type => 'goal', :second_player => self).count
  end

  def injuries
    MatchEvent.where(:event_type => 'injury', :first_player => self).count
  end

  def yellow_cards
    MatchEvent.where(:event_type => 'yellow card', :first_player => self).count
  end

  def double_yellow_cards
    MatchEvent.where(:event_type => 'double yellow card', :first_player => self).count
  end

  def red_cards
    MatchEvent.where(:event_type => 'red card', :first_player => self).count
  end
end
