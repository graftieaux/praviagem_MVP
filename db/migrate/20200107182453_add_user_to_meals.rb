class AddUserToMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :user, foreign_key: true
    remove_column :meals, :shop_id, :integer
  end
end
