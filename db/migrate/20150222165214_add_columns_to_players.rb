class AddColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :strength, :integer
    add_column :players, :talent, :integer
  end
end
