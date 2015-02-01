class CreateRedCardDescriptions < ActiveRecord::Migration
  def change
    create_table :red_card_descriptions do |t|
      t.string :description

      t.timestamps
    end
  end
end
