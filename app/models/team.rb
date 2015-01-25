class Team < ActiveRecord::Base
  has_many :players
  belongs_to :stadium
  belongs_to :user
  belongs_to :tactic

  mount_uploader :logo, TeamLogoUploader
end
