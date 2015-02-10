class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :win_points
      t.integer :draw_points
      t.integer :win_price
      t.integer :draw_price
      t.integer :top_scorer_price
      t.integer :best_assistant_price

      t.timestamps
    end
  end
end
