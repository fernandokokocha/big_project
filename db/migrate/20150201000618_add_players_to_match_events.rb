class AddPlayersToMatchEvents < ActiveRecord::Migration
  def change
    add_column :match_events, :first_player_id, :integer
    add_column :match_events, :second_player_id, :integer
  end
end
