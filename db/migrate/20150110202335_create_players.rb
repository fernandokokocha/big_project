class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :position
      t.integer :salary
      t.integer :reflex
      t.integer :handling
      t.integer :discipline
      t.integer :tackling
      t.integer :work_rate
      t.integer :positioning
      t.integer :creativity
      t.integer :technique
      t.integer :instinct
      t.integer :shots
      t.integer :condition

      t.timestamps
    end
  end
end
