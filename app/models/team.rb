class Team < ActiveRecord::Base
  has_many :players
  belongs_to :stadium
  belongs_to :user

  mount_uploader :logo, TeamLogoUploader
end
