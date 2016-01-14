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
    if function == "add"
      session[:duffel][params[:id]] += 1
    else
      session[:duffel][params[:id]] -= 1
      if session[:duffel][params[:id]] == 0
        session[:duffel] = session[:duffel].except(params[:id])
        @duffel.contents = session[:duffel]
      end
    end
    redirect_to "/duffel"
  end
end
