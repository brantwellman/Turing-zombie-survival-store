class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    if @item.active?
      @partial = 'partials/add_to_duffel'
    else
      @partial = 'partials/sold_out'
    end
  end
end
