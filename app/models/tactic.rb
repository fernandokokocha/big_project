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
    reflections_values.include? player
  end

  def all_field_players
    reflections_values_without_gk
  end

  def all_players
    reflections_values
  end

  private
  def reflections_values
    reflections = Tactic.reflections.select do |association_name, reflection|
      reflection.macro == :belongs_to
    end
    reflections.values.map { |reflection| send(reflection.name) }
  end

  def reflections_values_without_gk
    reflections = Tactic.reflections.select do |association_name, reflection|
      reflection.macro == :belongs_to and reflection.name != :gk
    end
    reflections.values.map { |reflection| send(reflection.name) }
  end
end

