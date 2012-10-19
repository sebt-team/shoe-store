class Api::ShoesController < ApplicationController
	before_action :set_shoe, only: [:show, :edit, :update, :destroy]

  def index
  	@shoes = Shoe.all
  end

  def show
  end

  def create
  end

  def update
  end

  def destoy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_shoe
    @shoe = Shoe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shoe_params
    params.require(:shoe).permit(
    	:model,
    	:isbn,
    	:release_year,
    	:sku,
    	:picture,
    	:brand_id)
  end
end
