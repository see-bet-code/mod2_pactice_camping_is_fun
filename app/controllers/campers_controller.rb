class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def show
    @camper = Camper.find(params[:id])
  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    if @camper.save
      redirect_to camper_path(@camper)
    else
      flash[:errors] = @camper.errors.full_messages
      render 'new'
    end
  end

  private

  def camper_params
    params.require(:camper).permit(
      :name,
      :age
    )
  end

end
