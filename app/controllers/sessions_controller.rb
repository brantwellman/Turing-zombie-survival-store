class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.admin?
        flash[:notice] = "Logged in with admin access."
        path = RedirectPreparer.set(session[:referrer], admin_dashboard_path)
        redirect_to path
      else
        flash[:notice] = "Logged in as #{@user.first_name}"
        path = RedirectPreparer.set(session[:referrer], dashboard_path)
        session[:referrer] = nil
        redirect_to path
      end
    else
      flash.now[:error] = "Your email or password is incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
