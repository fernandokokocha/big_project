class Tactic < ActiveRecord::Base
  has_one :team
  belongs_to :gk, class_name: 'Player'
  belongs_to :d1, class_name: 'Player'
  belongs_to :d2, class_name: 'Player'
  belongs_to :d3, class_name: 'Player'
  belongs_to :d4, class_name: 'Player'
  belongs_to :dm1, class_name: 'Player'
  belongs_to :dm2, class_name: 'Player'
  belongs_to :am1, class_name: 'Player'
  belongs_to :am2, class_name: 'Player'
  belongs_to :s1, class_name: 'Player'
  belongs_to :s2, class_name: 'Player'

  def include? player
    attributes.each do |key, value|
      next if key == "id"
      return true if value == player.id
    end
    false
  end

  def all_field_players
    result = []
    result << d1
    result << d2
    result << d3
    result << d4
    result << dm1
    result << dm2
    result << am1
    result << am2
    result << s1
    result << s2
    result
  end

  def all_players
    result = all_field_players
    result << gk
    result
  end
end
