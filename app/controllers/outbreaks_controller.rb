class OutbreaksController < ApplicationController
  def new
    @outbreak = Outbreak.new
  end

  def create
    @outbreak = Outbreak.new(outbreak_params)
    if @outbreak.save
      flash[:notice] = "Thanks for the heads up... now get out of there!"
      redirect_to map_path
    else
      flash.now[:error] = "You better check that address and danger level, amigo."
      render :new
    end
  end

  private

  def outbreak_params
    params.require(:outbreak).permit(:address, :danger)
  end
end
