class AddStadiumToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :stadium_id, :integer
  end
end
