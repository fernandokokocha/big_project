class Tactic < ActiveRecord::Base
  has_one :team

  def include? player
    attributes.each do |key, value|
      return true if value == player.id
    end
    false
  end
end
