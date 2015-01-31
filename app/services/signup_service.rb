class SignupService
  def call(form_object)
    form_object.validate!

    ActiveRecord::Base.transaction do
      user = User.create!(email: form_object.email,
                          password: form_object.password,
                          password_confirmation: form_object.password_confirmation)

      stadium = Stadium.create!(name: form_object.team_name + " Arena",
                                capacity: 10000,
                                roof: false)

      @team = Team.create!(name: form_object.team_name,
                           user: user,
                           balance: 10**9,
                           reputation: 100,
                           stadium: stadium)

      @team.logo = File.open(File.open(File.join(Rails.root, 'app/assets/images/default_logo.jpg')))
      @team.save

      2.times {generate_gk}
      8.times {generate_d}
      4.times {generate_dm}
      4.times {generate_am}
      4.times {generate_s}

      initial_tactic!
    end

    form_object
  rescue form_object.class::ValidationError
    false
  rescue ActiveRecord::RecordInvalid
    form_object.errors.add(:email, "already exists")
    false
  end

  def initial_tactic!
    gk = Position.find_by_name("GK")
    d = Position.find_by_name("D")
    dm = Position.find_by_name("DM")
    am = Position.find_by_name("AM")
    s = Position.find_by_name("S")
    gk_players = @team.players.where(position: gk).sort {|a,b| a.gk_power <=> b.gk_power}.reverse
    d_players = @team.players.where(position: d).sort {|a,b| a.d_power <=> b.d_power}.reverse
    dm_players = @team.players.where(position: dm).sort {|a,b| a.dm_power <=> b.dm_power}.reverse
    am_players = @team.players.where(position: am).sort {|a,b| a.am_power <=> b.am_power}.reverse
    s_players = @team.players.where(position: s).sort {|a,b| a.s_power <=> b.s_power}.reverse

    tactic = Tactic.new
    tactic.gk = gk_players.first.id
    tactic.d1 = d_players.first.id
    tactic.d2 = d_players[1].id
    tactic.d3 = d_players[2].id
    tactic.d4 = d_players[3].id
    tactic.dm1 = dm_players.first.id
    tactic.dm2 = dm_players[1].id
    tactic.am1 = am_players.first.id
    tactic.am2 = am_players[1].id
    tactic.s1 = s_players.first.id
    tactic.s2 = s_players[1].id

    @team.tactic = tactic
    tactic.save!
  end

  private
  def generate_player
    player = Player.new
    player.team = @team
    loop do
      player.first_name = Faker::Name.first_name
      break unless ["a", "e"].include? player.first_name[-1, 1]
    end
    player.last_name = Faker::Name.last_name
    player.birthdate = Faker::Date.between(Date.today - 30.years, Date.today - 18.years)
    player.salary = 10000
    player.reflex = 100 + rand(1000)
    player.handling = 100 + rand(1000)
    player.discipline = 100 + rand(1000)
    player.tackling = 100 + rand(1000)
    player.work_rate = 100 + rand(1000)
    player.positioning = 100 + rand(1000)
    player.creativity = 100 + rand(1000)
    player.technique = 100 + rand(1000)
    player.instinct = 100 + rand(1000)
    player.shots = 100 + rand(1000)
    player.condition = 100 + rand(2000)

    player
  end

  def generate_gk
    player = generate_player
    player.position = Position.find_by_name("GK")
    player.reflex += 1000
    player.handling += 1000
    player.save
  end

  def generate_d
    player = generate_player
    player.position = Position.find_by_name("D")
    player.discipline += 1000
    player.tackling += 1000
    player.save
  end

  def generate_dm
    player = generate_player
    player.position = Position.find_by_name("DM")
    player.work_rate += 1000
    player.positioning += 1000
    player.save
  end

  def generate_am
    player = generate_player
    player.position = Position.find_by_name("AM")
    player.creativity += 1000
    player.technique += 1000
    player.save
  end

  def generate_s
    player = generate_player
    player.position = Position.find_by_name("S")
    player.instinct += 1000
    player.shots += 1000
    player.save
  end
end