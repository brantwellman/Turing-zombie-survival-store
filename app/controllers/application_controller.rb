class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :all_categories,
                :current_user,
                :current_admin?,
                :unauthenticated_user_error
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

  def unauthenticated_user_error
    render(file: "/public/404") unless current_user
  end

  def redirect_path(referrer, normal_redirect)
    referrer || normal_redirect
  end
end
