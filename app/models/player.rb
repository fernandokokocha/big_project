class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :position

  def current_age
    ((Date.today - birthdate)/365.25).to_i
  end
end
