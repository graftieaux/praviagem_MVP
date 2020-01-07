class Order < ApplicationRecord
  belongs_to :user

  has_many :meal_orders
  has_many :meals, through: :meal_orders

  accepts_nested_attributes_for :meal_orders, reject_if: :all_blank, allow_destroy: true

  def available_quantities
    # TODO return the real available quantity based on the stock
    (1..8)
  end

end
