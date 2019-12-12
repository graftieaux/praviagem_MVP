class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :customer_id
      t.integer :price
      t.integer :meal_id

      t.timestamps
    end
  end
end
