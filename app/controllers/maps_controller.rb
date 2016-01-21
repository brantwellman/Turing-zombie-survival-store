class MapsController < ApplicationController
  def show
    @safe_houses = User.safe_houses
    @outbreaks = Outbreak.all
  end
end
