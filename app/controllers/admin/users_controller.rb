class Admin::UsersController < Admin::BaseController
  def index
    orders = Order.all
    @status_breakdown = orders.each_with_object({}) do |order, hash|
      if hash[order.status].nil?
        hash[order.status] = 0
      else
        hash[order.status] += 1
      end
    end

    if params[:filter]
      @orders = Order.filter_orders(params[:filter])
    else
      @orders = Order.all
    end
  end
end
