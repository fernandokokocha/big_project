class CreateGoalDescriptions < ActiveRecord::Migration
  def change
    create_table :goal_descriptions do |t|
      t.string :description

      t.timestamps
    end
  end
end
