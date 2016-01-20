class Admin::ItemsController < Admin::BaseController
  before_action :find_item, only: [:edit, :update, :destroy]
  before_action :find_categories, only: [:edit, :update]

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
      flash.now[:errors] = @item.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    flash[:notice] = "Item Updated!"
    redirect_to @item
  end

  def destroy
    @item.destroy
    flash[:notice] = "Item Deleted!"
    redirect_to @item
  end

  private

  def item_params
    params.require(:item).permit(
      :title,
      :description,
      :price,
      :category_id,
      :image
    )
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def find_categories
    @categories = Category.all
  end
end
