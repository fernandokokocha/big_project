class CreateYellowCardDescriptions < ActiveRecord::Migration
  def change
    create_table :yellow_card_descriptions do |t|
      t.string :description

      t.timestamps
    end
  end
end
