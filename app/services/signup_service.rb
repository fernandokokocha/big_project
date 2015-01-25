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
                   stadium: stadium)

      @team.logo = File.open(File.open(File.join(Rails.root, 'app/assets/images/default_logo.jpg')))
      @team.save

      2.times {generate_gk}
      8.times {generate_d}
      4.times {generate_dm}
      4.times {generate_am}
      4.times {generate_s}
    end

    form_object
  rescue form_object.class::ValidationError
    false
  rescue ActiveRecord::RecordInvalid
    form_object.errors.add(:email, "already exists")
    false
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
    player.reflex = 1 + rand(10)
    player.handling = 1 + rand(10)
    player.discipline = 1 + rand(10)
    player.tackling = 1 + rand(10)
    player.work_rate = 1 + rand(10)
    player.positioning = 1 + rand(10)
    player.creativity = 1 + rand(10)
    player.technique = 1 + rand(10)
    player.instinct = 1 + rand(10)
    player.shots = 1 + rand(10)
    player.condition = 1 + rand(20)

    player
  end

  def generate_gk
    player = generate_player
    player.position = Position.find_by_name("GK")
    player.reflex += 10
    player.handling += 10
    player.save
  end

  def generate_d
    player = generate_player
    player.position = Position.find_by_name("D")
    player.discipline += 10
    player.tackling += 10
    player.save
  end

  def generate_dm
    player = generate_player
    player.position = Position.find_by_name("DM")
    player.work_rate += 10
    player.positioning += 10
    player.save
  end

  def generate_am
    player = generate_player
    player.position = Position.find_by_name("AM")
    player.creativity += 10
    player.technique += 10
    player.save
  end

  def generate_s
    player = generate_player
    player.position = Position.find_by_name("S")
    player.instinct += 10
    player.shots += 10
    player.save
  end
end