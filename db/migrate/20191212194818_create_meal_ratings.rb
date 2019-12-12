class CreateMealRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_ratings do |t|
      t.date :date
      t.integer :rating
      t.integer :meal_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
