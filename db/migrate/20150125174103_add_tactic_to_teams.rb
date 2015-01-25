class AddTacticToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :tactic_id, :integer
  end
end
