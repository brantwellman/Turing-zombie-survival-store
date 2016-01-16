class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.first_name}"
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    if @user.admin?
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :address,
        :city,
        :state,
        :zipcode,
        :password,
        :password_confirmation,
        :role)
    else
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :address,
        :city,
        :state,
        :zipcode,
        :password,
        :password_confirmation)
  end
end
