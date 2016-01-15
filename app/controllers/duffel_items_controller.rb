class DuffelItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @duffel.add_item(item.id)
    session[:duffel] = @duffel.contents
    flash[:notice] = "We stuffed the #{item.title} in your Go-Bag"
    redirect_to items_path
  end

  def index
    @items = @duffel.duffel_items
  end

  def update
    function = params[:function]
    @duffel.update_quantity(params[:function], params[:id])
    session[:duffel] = @duffel.contents
    redirect_to "/duffel"
  end
end
