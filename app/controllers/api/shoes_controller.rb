=begin

Curl commands for API Shoe testing
=================================

# Create a new shoes
(echo -n '{"shoe": {"model": "SuperBoots", "brand_id": "4","isbn": "6578-56-48873-6", "release_year": "2011","sku": "21313","photo":"data:image/png;base64,';base64 -w 0 ~/foto2.png; echo '"}}')|
curl -v -XPOST -H 'Accept: application/json' -H 'Content-Type: application/json' -d @- http://localhost:3000/api/shoes | jq

# Update a picture for an existing shoes
(echo -n '{"shoe": {"photo":"data:image/png;base64,';base64 -w 0 ~/foto2.png; echo '"}}')|
curl -v -XPATCH -H 'Accept: application/json' -H 'Content-Type: application/json' -d @- http://localhost:3000/api/shoes/12 | jq

# Delete a shoes
curl -v -XDELETE http://localhost:3000/api/shoes/13 | jq

# List shoes
curl -v http://localhost:3000/api/shoes | jq

# Get a particular shoe 
curl -v http://localhost:3000/api/shoes/2 | jq
#TODO: Tweak json response for attribute photo in order to get a base64 string for decoding on client side and show photo

=end

module Api
  class ShoesController < ApplicationController # A new ApplicationController inside Api module. Take a look!
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
      if @shoe.save
        render json: @shoe, status: :created, location: @shoe
      else
        render json: @shoe.errors, status: :unprocessable_entity
      end      
    end

    # PATCH/PUT /shoes/1.json
    def update
      if @shoe.update(shoe_params)
        render json: @shoe
      else
        render json: @shoe.errors, status: :unprocessable_entity
      end
    end

    # DELETE /shoes/1.json
    def destroy
      @shoe.destroy
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
