class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    if current_user
      order = Order.new()
    else
      redirect_to login_path
    end
  end
end
