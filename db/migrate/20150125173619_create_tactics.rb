class CreateTactics < ActiveRecord::Migration
  def change
    create_table :tactics do |t|
      t.integer :gk
      t.integer :d1
      t.integer :d2
      t.integer :d3
      t.integer :d4
      t.integer :dm1
      t.integer :dm2
      t.integer :am1
      t.integer :am2
      t.integer :s1
      t.integer :s2

      t.timestamps
    end
  end
end
