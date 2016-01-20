class MapsController < ApplicationController
  def show
    @users = User.all
    @safe_houses = @users.safe_houses
  end
end
