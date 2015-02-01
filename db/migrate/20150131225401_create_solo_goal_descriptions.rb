class CreateSoloGoalDescriptions < ActiveRecord::Migration
  def change
    create_table :solo_goal_descriptions do |t|
      t.string :description

      t.timestamps
    end
  end
end
