class CreateMealPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_prices do |t|
      t.integer :previous_price
      t.integer :promotion
      t.integer :meal_id

      t.timestamps
    end
  end
end
