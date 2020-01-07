class Meal < ApplicationRecord
  belongs_to :user

  has_many :meal_orders
  has_many :orders, through: :meal_orders

  def all_info
    "$#{newprice} - #{description}"
  end
end
