class Order < ApplicationRecord
  belongs_to :meal
  #belongs_to :customer

  def available_quantities
    # TODO return the real available quantity based on the stock
    (1..8)
  end

end
