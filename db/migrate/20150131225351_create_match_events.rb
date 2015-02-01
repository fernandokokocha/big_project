class CreateMatchEvents < ActiveRecord::Migration
  def change
    create_table :match_events do |t|
      t.string :event_type
      t.integer :time
      t.string :description

      t.timestamps
    end
  end
end