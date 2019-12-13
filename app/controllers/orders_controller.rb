class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).all
  end

  def show
    @order = Order.find(params[:id])
    @meal = @order.meal
    authorize @order
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @order = @meal.orders.new(order_params)
    @order.user = current_user
    authorize @order
    @order.save
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:time, :quantity, :rating)
  end
end
