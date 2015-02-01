class CreateInjuryDescriptions < ActiveRecord::Migration
  def change
    create_table :injury_descriptions do |t|
      t.string :description

      t.timestamps
    end
  end
end
