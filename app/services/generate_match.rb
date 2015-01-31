class GenerateMatch
  def call(form_object)
    home = Team.find(form_object[:home_id])
    away = Team.find(form_object[:away_id])

    ActiveRecord::Base.transaction do
      @match = Match.new
      @match.home = home
      @match.away = away
      @match.date = Date.today
      @match.attendance = calculate_attendance
      generate_report!
      @match.save
    end

    form_object
  end

  def generate_report!
    @match.home_score = 0
    @match.away_score = 0
    @match.report = ""
    home_dp = @match.home.defensive_power
    home_op = @match.home.offensive_power
    away_dp = @match.away.defensive_power
    away_op = @match.away.offensive_power
    home_situations = (home_op - away_dp) / 1000
    home_situations.times do
      shoter, assister = pick_enders @match.home
      goalkeeper = Player.find(@match.away.tactic.gk)
      if goal? shoter, goalkeeper
        if shoter == assister
          situation = shoter.full_name + " bez asysty, gol!"
        else
          situation = assister.full_name + " podaje, " + shoter.full_name + " wykancza, gol!"
        end
        @match.home_score += 1
      else
        if shoter == assister
          situation = shoter.full_name + " samolubnie, nie trafia"
        else
          situation = assister.full_name + " swietnie podaje, ale " + shoter.full_name + " partaczy jego wysilek"
        end
      end
      @match.report += situation + "\n"
    end


    away_situations = (away_op - home_dp) / 1000
    away_situations.times do
      shoter, assister = pick_enders @match.away
      goalkeeper = Player.find(@match.home.tactic.gk)
      if goal? shoter, goalkeeper
        if shoter == assister
          situation = shoter.full_name + " bez asysty, gol!"
        else
          situation = assister.full_name + " podaje, " + shoter.full_name + " wykancza, gol!"
        end
        @match.away_score += 1
      else
        if shoter == assister
          situation = shoter.full_name + " samolubnie, nie trafia"
        else
          situation = assister.full_name + " swietnie podaje, ale " + shoter.full_name + " partaczy jego wysilek"
        end
      end
      @match.report += situation + "\n"
    end

    @match.save

  end

  def pick_enders(team)
    return team.players.sample, team.players.sample
  end

  def goal?(shoter, goalkeeper)
    rand = rand(1000)
    (shoter.s_power * 2 - goalkeeper.gk_power) > rand
  end

  def calculate_attendance
    wanted = @match.home.reputation * 10 + @match.away.reputation * 10
    [wanted, @match.home.stadium.capacity].min
  end

end