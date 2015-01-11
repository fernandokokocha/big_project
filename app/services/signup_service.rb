class SignupService
  def call(form_object)
    form_object.validate!

    ActiveRecord::Base.transaction do
      user = User.create!(email: form_object.email,
                          password: form_object.password,
                          password_confirmation: form_object.password_confirmation)
      Team.create!(name: form_object.team_name,
                   user: user,
                   balance: 10**9)
    end

    form_object
  rescue form_object.class::ValidationError
    false
  rescue ActiveRecord::RecordNotUnique
    form_object.errors.add(:email, "Email already exists")
    false
  end
end