class MapsController < ApplicationController
  def show
    @safe_houses = User.safe_houses
  end
end
