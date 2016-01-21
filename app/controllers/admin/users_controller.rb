class Admin::UsersController < Admin::BaseController
  def index
    if params[:filter]
      @orders = Order.filter_orders(params[:filter])
    else
      @orders = Order.all
    end
  end
end
