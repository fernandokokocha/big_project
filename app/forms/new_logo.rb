class NewLogo
  ValidationError = Class.new(StandardError)

  include Virtus.model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :logo, File

  validates :logo, presence: true

  def persisted?
    false
  end

  def validate!
    raise ValidationError, errors unless valid?
  end
end