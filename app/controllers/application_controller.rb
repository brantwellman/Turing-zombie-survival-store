class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :all_categories
  before_action :set_duffel

  def all_categories
    Category.all
  end

  def set_duffel
    @duffel = Duffel.new(session[:duffel])
  end
end
