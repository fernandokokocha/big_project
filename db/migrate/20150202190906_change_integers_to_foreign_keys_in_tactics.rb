class ChangeIntegersToForeignKeysInTactics < ActiveRecord::Migration
  def change
    rename_column :tactics, :gk, :gk_id
    rename_column :tactics, :d1, :d1_id
    rename_column :tactics, :d2, :d2_id
    rename_column :tactics, :d3, :d3_id
    rename_column :tactics, :d4, :d4_id
    rename_column :tactics, :dm1, :dm1_id
    rename_column :tactics, :dm2, :dm2_id
    rename_column :tactics, :am1, :am1_id
    rename_column :tactics, :am2, :am2_id
    rename_column :tactics, :s1, :s1_id
    rename_column :tactics, :s2, :s2_id
  end
end
