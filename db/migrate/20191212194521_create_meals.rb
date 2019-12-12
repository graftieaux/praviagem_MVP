class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :category
      t.integer :newprice
      t.integer :quantity
      t.string :description
      t.time :time
      t.integer :shop_id

      t.timestamps
    end
  end
end
