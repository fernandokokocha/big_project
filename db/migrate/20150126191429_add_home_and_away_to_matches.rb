class AddHomeAndAwayToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :home_id, :integer
    add_column :matches, :away_id, :integer
  end
end
