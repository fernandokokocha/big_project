class CreateTactics < ActiveRecord::Migration
  def change
    create_table :tactics do |t|
      t.string :gk
      t.string :d1
      t.string :d2
      t.string :d3
      t.string :d4
      t.string :dm1
      t.string :dm2
      t.string :am1
      t.string :am2
      t.string :s1
      t.integer :s2

      t.timestamps
    end
  end
end
