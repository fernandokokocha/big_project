class RemoveSalaryColumnInPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :salary
  end
end
