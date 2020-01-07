class Shop::OrdersController < ApplicationController
  def index
    @orders = policy_scope([:shop, Order]).all
    authorize [:shop, @orders]
  end
end
