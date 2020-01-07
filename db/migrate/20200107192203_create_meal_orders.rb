class CreateMealOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_orders do |t|
      t.references :order, foreign_key: true
      t.references :meal, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
