class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
  @item = Item.create(item_params)
    if @item.save
      flash[:notice] = "#{@item.title} has been created!"
      redirect_to @item
    else
      flash.now[:errors] = @item.errors.full_messages.join(', ')
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category_id, :image)
  end
end
