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

  def points
    Match.where(:home_id => id).select {|match| match.home_win}.count * 3 +
      Match.where(:home_id => id).select {|match| match.draw}.count +
      Match.where(:away_id => id).select {|match| match.away_win}.count * 3 +
      Match.where(:away_id => id).select {|match| match.draw}.count
  end

  def goals_for
    result = 0
    Match.where(:home_id => id).each do |match|
      result += match.home_score
    end
    Match.where(:away_id => id).each do |match|
      result += match.away_score
    end
    result
  end

  def goals_against
    result = 0
    Match.where(:home_id => id).each do |match|
      result += match.away_score
    end
    Match.where(:away_id => id).each do |match|
      result += match.home_score
    end
    result
  end

  def goals_diff
    goals_for - goals_against
  end

  def wins
    Match.where(:home_id => id).select {|match| match.home_win}.count +
      Match.where(:away_id => id).select {|match| match.away_win}.count
  end

  def losts
    Match.where(:home_id => id).select {|match| match.away_win}.count +
      Match.where(:away_id => id).select {|match| match.home_win}.count
  end

  def draws
    Match.where(:home_id => id).select {|match| match.draw}.count +
      Match.where(:away_id => id).select {|match| match.draw}.count
  end

  def matches
    Match.all.select {|match| match.participant? self}.count
  end
end
