class MapsController < ApplicationController
  def show
    @safe_houses = User.safe_houses
  end

  def index

  end
end
