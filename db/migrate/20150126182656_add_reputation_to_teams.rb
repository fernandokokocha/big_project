class AddReputationToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :reputation, :integer
  end
end
