class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
    @item_quantities = @order.item_quantities
  end
end
