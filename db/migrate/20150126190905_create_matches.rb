class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :home_score
      t.integer :away_score
      t.date :date
      t.integer :attendance
      t.text :report

      t.timestamps
    end
  end
end
