class DuffelItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @duffel.add_item(item.id)
    session[:duffel] = @duffel.contents
    flash[:notice] = "We stuffed #{item.title} in your Go-Bag"
    redirect_to items_path
  end
end