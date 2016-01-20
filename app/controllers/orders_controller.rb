class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      unauthenticated_user_error
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    if current_user
      new_order = Order.new(user_id: current_user.id) do |order|
        @duffel.contents.each do |item_id, quantity|
          order.order_items.new(item_id: item_id, quantity: quantity)
        end
      end
      if new_order.save
        session[:duffel] = nil
        flash[:notice] = "Order was successfully placed."
        redirect_to orders_path
      end
    else
      session[:referrer] = URI(request.referrer).path
      redirect_to login_path
    end
  end
end
