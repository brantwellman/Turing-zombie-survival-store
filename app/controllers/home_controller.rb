class HomeController < ApplicationController
  def welcome
  end

  # def index
  #   render :layout => "home"
  # end
  # leaving this comment as we want to refactor this as part of dynamically generating the class of the page image when it's the root_path
end
