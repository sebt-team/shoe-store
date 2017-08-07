class ShoesController < ApplicationController
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]

  # GET /shoes
  def index
    @shoes = Shoe.all
  end

  # GET /shoes/1
  def show
  end

  # GET /shoes/new
  def new
    @shoe = Shoe.new
  end

  # GET /shoes/1/edit
  def edit
  end

  # POST /shoes
  def create
    @shoe = Shoe.new(shoe_params)
    if @shoe.save
      redirect_to @shoe, notice: 'Shoe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shoes/1
  def update
    if @shoe.update(shoe_params)
       redirect_to @shoe, notice: 'Shoe was successfully updated.'
    else
      render :edit
    end    
  end

  # DELETE /shoes/1
  def destroy
    @shoe.destroy
    redirect_to shoes_url, notice: 'Shoe was successfully destroyed.'
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
