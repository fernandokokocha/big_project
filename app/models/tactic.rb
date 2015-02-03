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

  def defensive_power
    (gk.gk_power * 0.9 +
      d1.d_power * 0.9 +
      d2.d_power * 0.9 +
      d3.d_power * 0.9 +
      d4.d_power * 0.9 +
      dm1.dm_power * 0.6 +
      dm2.dm_power * 0.6 +
      am1.am_power * 0.4 +
      am2.am_power * 0.4 +
      s1.s_power * 0.1 +
      s2.s_power * 0.1).to_i
  end

  def offensive_power
    (gk.gk_power * 0.0 +
      d1.d_power * 0.2 +
      d2.d_power * 0.2 +
      d3.d_power * 0.2 +
      d4.d_power * 0.2 +
      dm1.dm_power * 0.8 +
      dm2.dm_power * 0.8 +
      am1.am_power * 1.2 +
      am2.am_power * 1.2 +
      s1.s_power * 1.8 +
      s2.s_power * 1.8).to_i
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

