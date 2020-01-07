class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy

  #validates :first_name, presence: true
  #validates :last_name, presence: true
  #validates :address, presence: true
  #validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  ROLES = ["Shop", "Customer"]

  validates :role, inclusion: { in: ROLES,
    message: "%{value} is not a valid role" }

def average_rating
    counter = 0
    meals = Meal.where(shop_id: self)
    order_count = 0

    meals.each do |meal|
      order_count += meal.orders.count
      rated_orders = meal.orders
      rated_orders.each do |order|
        counter += order.rating
      end
    end

    if counter.zero?
      average_rating = 0
    else
      average_rating = (counter / order_count).to_i
    end
    average_rating
  end

end
