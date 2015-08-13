class ProductPersonMapsController < ApplicationController
  before_action :set_product_person_map, only: [:show, :edit, :update, :destroy]

  # GET /product_person_maps
  # GET /product_person_maps.json
  def index
    @product_person_maps = ProductPersonMap.all
  end

  # GET /product_person_maps/1
  # GET /product_person_maps/1.json
  def show
  end

  # GET /product_person_maps/new
  def new
    @product_person_map = ProductPersonMap.new
  end

  # GET /product_person_maps/1/edit
  def edit
  end

  # POST /product_person_maps
  # POST /product_person_maps.json
  def create
    @product_person_map = ProductPersonMap.new(product_person_map_params)

    respond_to do |format|
      if @product_person_map.save
        format.html { redirect_to @product_person_map, notice: 'Product person map was successfully created.' }
        format.json { render :show, status: :created, location: @product_person_map }
      else
        format.html { render :new }
        format.json { render json: @product_person_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_person_maps/1
  # PATCH/PUT /product_person_maps/1.json
  def update
    respond_to do |format|
      if @product_person_map.update(product_person_map_params)
        format.html { redirect_to @product_person_map, notice: 'Product person map was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_person_map }
      else
        format.html { render :edit }
        format.json { render json: @product_person_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_person_maps/1
  # DELETE /product_person_maps/1.json
  def destroy
    @product_person_map.destroy
    respond_to do |format|
      format.html { redirect_to product_person_maps_url, notice: 'Product person map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_person_map
      @product_person_map = ProductPersonMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_person_map_params
      params.require(:product_person_map).permit(:product_id, :person_id, :rank)
    end
end
