class Signup
  ValidationError = Class.new(StandardError)

  include Virtus.model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :email, String
  attribute :password, String
  attribute :password_confirmation, String
  attribute :team_name, String

  validates :email, presence: true
  validates :team_name, presence: true
  validates :password, presence: true
  validates :password, confirmation: true

  def persisted?
    false
  end

  def validate!
    raise ValidationError, errors unless valid?
  end
end