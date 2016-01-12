class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:title])
  end
end
