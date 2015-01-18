class Team < ActiveRecord::Base
  has_many :players
  belongs_to :user

  mount_uploader :logo, TeamLogoUploader
end
