class AddUserToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user, foreign_key: true
    remove_column :orders, :customer_id, :integer
  end
end
