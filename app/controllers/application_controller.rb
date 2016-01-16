class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :all_categories, :current_user, :current_admin?
  before_action :set_duffel

  def all_categories
    Category.all
  end

  def set_duffel
    @duffel = Duffel.new(session[:duffel])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
