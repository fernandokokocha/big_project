class Team < ActiveRecord::Base
  has_many :players
  belongs_to :stadium
  belongs_to :user
  belongs_to :tactic

  mount_uploader :logo, TeamLogoUploader

  def to_s
    "#{name} (#{user.email})"
  end

  def logo_path
    if logo.present?
      logo
    else
      logo.default_url
    end
  end

  def logo_thumb_path
    if logo.present?
      logo.thumb
    else
      logo.default_thumb_url
    end
  end

  def logo_micro_path
    if logo.present?
      logo.micro
    else
      logo.default_micro_url
    end
  end
end
