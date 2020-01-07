class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @meals = Meal.all
    @shops = User.where(role: "Shop").geocoded
    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude
      }
    end
  end

  def show
    @meal = Meal.find(params[:id])
    # authorize @meal
    @order = @meal.orders.new
    Meal.all.each do |meal|
      @order.meal_orders.build(meal_id: meal.id, quantity: 0)
    end
    @orders_reviews = Order.joins(:user).where(meal_id: @meal.id).limit(5)
  end

  def new
    @meal = Meal.new
    authorize @meal
  end

  def create
  end

  private

  def meal_params
    params.require(:meal).permit(:category, :description, :newprice,
                                 :quantity, :price)
  end
end
