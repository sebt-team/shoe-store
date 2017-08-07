class Api::ShoesController < ApplicationController
  #La siguiente linea es para saltar autenticación, y realizar pruebas por postman.
  skip_before_action :verify_authenticity_token, :only => [:create, :updte, :destroy]

	before_action :set_shoe, only: [:show, :edit, :update, :destroy]

  def index
  	@shoes = Shoe.all
  end

  def show
  end

  def create
    @shoe = Shoe.new(shoe_params)

    respond_to do |format|
      if @shoe.save
        format.json { render :show, status: :created, location: @shoe }
      else
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoes/1
  def update
    respond_to do |format|
      if @shoe.update(shoe_params)
        format.json { render :show, status: :ok, location: @shoe }
      else
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoes/1
  def destroy
    @shoe.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
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
