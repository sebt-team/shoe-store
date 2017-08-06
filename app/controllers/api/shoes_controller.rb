module Api
  class ShoesController < ApplicationController
    before_action :set_shoe, only: [:show, :edit, :update, :destroy]

    # GET /shoes.json
    def index
      @shoes = Shoe.all
      render json: @shoes
    end

    # GET /shoes/1.json
    def show
      render json: @shoe      
    end

    # POST /shoes.json
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

    # PATCH/PUT /shoes/1.json
    def update
      respond_to do |format|
        if @shoe.update(shoe_params)
          format.json { render :show, status: :ok, location: @shoe }
        else
          format.json { render json: @shoe.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /shoes/1.json
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
        params.require(:shoe).permit(:model, :brand_id, :isbn, :release_year, :sku, :photo, :remove_photo)
      end
  end
end
