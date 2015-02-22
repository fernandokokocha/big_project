class AddPauseColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :injury_pause, :boolean
    add_column :players, :cards_pause, :boolean
  end
end
