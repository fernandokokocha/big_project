class CreateDoubleYellowCardDescriptions < ActiveRecord::Migration
  def change
    create_table :double_yellow_card_descriptions do |t|
      t.string :description

      t.timestamps
    end
  end
end
