class SignupService
  def call(form_object)
    form_object.validate!

    ActiveRecord::Base.transaction do
      user = User.create!(email: form_object.email,
                          password: form_object.password,
                          password_confirmation: form_object.password_confirmation)
      team = Team.create!(name: form_object.team_name,
                   user: user,
                   balance: 10**9)

      20.times do
        player = Player.new
        player.team = team
        loop do
          player.first_name = Faker::Name.first_name
          break if player.first_name[-1, 1] != "a"
        end
        player.last_name = Faker::Name.last_name
        player.birthdate = Faker::Date.between(Date.today - 30.years, Date.today - 18.years)
        player.salary = 10000
        player.position = ["GK", "D", "DM", "OM", "S"].sample
        base = player.position == "GK" ? 10 : 1
        player.reflex = base + rand(10)
        player.handling = base + rand(10)
        base = player.position == "D" ? 10 : 1
        player.discipline = base + rand(10)
        player.tackling = base + rand(10)
        base = player.position == "DM" ? 10 : 1
        player.work_rate = base + rand(10)
        player.positioning = base + rand(10)
        base = player.position == "OM" ? 10 : 1
        player.creativity = base + rand(10)
        player.technique = base + rand(10)
        base = player.position == "S" ? 10 : 1
        player.instinct = base + rand(10)
        player.shots = base + rand(10)

        player.condition = 1 + rand(20)
        player.save
      end

    end

    form_object
  rescue form_object.class::ValidationError
    false
  rescue ActiveRecord::RecordNotUnique
    form_object.errors.add(:email, "Email already exists")
    false
  end
end