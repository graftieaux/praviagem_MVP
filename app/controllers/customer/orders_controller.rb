class Customer::OrdersController < ApplicationController
  def index
    @orders = policy_scope([:customer, Order]).all
    authorize [:customer, @orders]
  end

  def show
    @order = Order.find(params[:id])
    @meal = @order.meal
    authorize @order
  end

  def create
    # Remover do strong parameters os nested objects de meal
    # que vierem com quantidade < 1

    # if order_params[:meal_orders_attributes].present?
    #   order_params[:meal_orders_attributes].each do |meal_order_key|
    #     if meal_order_key[:quantity] < 1
    #       order_params[:meal_orders_attributes].delete(meal_order_key)
    #     end
    #   end
    # end

    @order = Order.new(order_params)
    @order.user = current_user
    authorize @order

    @order.save
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:time, :quantity, :rating, meal_orders_attributes: [:id, :meal_id, :quantity, :_destroy])
  end
end
