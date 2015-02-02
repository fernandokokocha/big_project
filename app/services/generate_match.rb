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
      @match.home_score = 0
      @match.away_score = 0
      generate_match_events!
      @match.save
    end

    form_object
  end


  private

  def generate_match_events!
    generate_home_goals!
    generate_away_goals!
    generate_injuries!
    generate_cards!
  end
  
  def generate_home_goals!
    goalkeeper = @match.away.tactic.gk
    home_situations.times do
      shooter = Player.find(pick_shooter @match.home)
      assistant = Player.find(pick_assistant @match.home)
      if goal? shooter, goalkeeper
        if shooter == assistant
          generate_solo_goal!(shooter)
        else
          generate_goal!(shooter, assistant)
        end
        @match.home_score += 1
      end
    end
  end
  
  def generate_away_goals!
    goalkeeper = @match.home.tactic.gk
    away_situations.times do
      shooter = pick_shooter @match.away
      assistant = pick_assistant @match.away
      if goal? shooter, goalkeeper
        if shooter == assistant
          generate_solo_goal!(shooter)
        else
          generate_goal!(shooter, assistant)
        end
        @match.away_score += 1
      end
    end
  end

  def generate_injuries!
    players = @match.home.tactic.all_players + @match.away.tactic.all_players
    players.each do |player|
      susceptibility = 3000 - player.condition
      r = rand(20000)
      if r < susceptibility
        event = MatchEvent.new
        event.event_type = "injury"
        event.match = @match
        event.time = rand(1..90)
        desc = InjuryDescription.order("RANDOM()").first
        desc = desc.description
        desc = desc.sub("X", player.full_name)
        event.description = desc
        event.first_player = player
        event.save
      end
    end
  end

  def generate_cards!
    players = @match.home.tactic.all_players + @match.away.tactic.all_players
    players.each do |player|
      susceptibility = player.d_power
      r1 = rand(15000)
      r2 = rand(150000)
      if r1 < susceptibility
        if r2 < susceptibility
          times = [rand(1..90), rand(1..90)]

          event = MatchEvent.new
          event.event_type = "yellow card"
          event.match = @match
          event.time = times.min
          desc = DoubleYellowCardDescription.order("RANDOM()").first
          desc = desc.description
          desc = desc.sub("X", player.full_name)
          event.description = desc
          event.first_player = player
          event.save

          event = MatchEvent.new
          event.event_type = "double yellow card"
          event.match = @match
          event.time = times.max
          desc = DoubleYellowCardDescription.order("RANDOM()").first
          desc = desc.description
          desc = desc.sub("X", player.full_name)
          event.description = desc
          event.first_player = player
          event.save
        else
          event = MatchEvent.new
          event.event_type = "yellow card"
          event.match = @match
          event.time = rand(1..90)
          desc = YellowCardDescription.order("RANDOM()").first
          desc = desc.description
          desc = desc.sub("X", player.full_name)
          event.description = desc
          event.first_player = player
          event.save
        end
      elsif r2 < susceptibility
        event = MatchEvent.new
        event.event_type = "red card"
        event.match = @match
        event.time = rand(1..90)
        desc = RedCardDescription.order("RANDOM()").first
        desc = desc.description
        desc = desc.sub("X", player.full_name)
        event.description = desc
        event.first_player = player
        event.save
      end
    end
  end

  def pick_assistant(team)
    r = rand(1..100)
    case r
      when 1..10
        team.tactic.s1
      when 11..20
        team.tactic.s2
      when 21..45
        team.tactic.am1
      when 46..70
        team.tactic.am2
      when 71..75
        team.tactic.dm1
      when 76..80
        team.tactic.dm2
      when 81..85
        team.tactic.d1
      when 86..90
        team.tactic.d2
      when 91..95
        team.tactic.d3
      when 96..100
        team.tactic.d4
      else
        "Impossibru"
    end
  end

  def pick_shooter(team)
    r = rand(1..100)
    case r
      when 1..20
        team.tactic.s1
      when 21..40
        team.tactic.s2
      when 41..50
        team.tactic.am1
      when 51..60
        team.tactic.am2
      when 61..70
        team.tactic.dm1
      when 71..80
        team.tactic.dm2
      when 81..85
        team.tactic.d1
      when 86..90
        team.tactic.d2
      when 91..95
        team.tactic.d3
      when 96..100
        team.tactic.d4
      else
        "Impossibru"
    end
  end

  def generate_goal!(shooter, assistant)
    event = MatchEvent.new
    event.event_type = "goal"
    event.match = @match
    event.time = rand(1..90)
    desc = GoalDescription.order("RANDOM()").first
    desc = desc.description
    desc = desc.sub("X", shooter.full_name)
    desc = desc.sub("Y", assistant.full_name)
    event.description = desc
    event.first_player = shooter
    event.second_player = assistant
    event.save
  end

  def generate_solo_goal!(shooter)
    event = MatchEvent.new
    event.event_type = "goal"
    event.match = @match
    event.time = rand(1..90)
    desc = SoloGoalDescription.order("RANDOM()").first
    desc = desc.description
    desc = desc.sub("X", shooter.full_name)
    event.description = desc
    event.first_player = shooter
    event.save
  end



  def goal?(shooter, goalkeeper)
    rand = rand(1000)
    (shooter.s_power * 2 - goalkeeper.gk_power) > rand
  end

  def calculate_attendance
    wanted = @match.home.reputation * 10 + @match.away.reputation * 10
    [wanted, @match.home.stadium.capacity].min
  end

  def home_situations
    home_op = @match.home.offensive_power
    away_dp = @match.away.defensive_power
    (home_op - away_dp) / 1000
  end

  def away_situations
    home_dp = @match.home.defensive_power
    away_op = @match.away.offensive_power
    (away_op - home_dp) / 1000
  end
end