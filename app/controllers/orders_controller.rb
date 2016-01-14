class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end
end
