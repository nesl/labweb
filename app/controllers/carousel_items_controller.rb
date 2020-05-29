class CarouselItemsController < ApplicationController
  before_action :authenticate_user!, only_member_actions: true
  before_action :set_carousel_item, only: [:show, :edit, :update, :destroy]

  # GET /carousel_items
  # GET /carousel_items.json
  def index
    @carousel_items = CarouselItem.all
  end

  # GET /carousel_items/1
  # GET /carousel_items/1.json
  def show
  end

  # GET /carousel_items/new
  def new
    @carousel_item = CarouselItem.new
  end

  # GET /carousel_items/1/edit
  def edit
  end

  # POST /carousel_items
  # POST /carousel_items.json
  def create
    @carousel_item = CarouselItem.new(carousel_item_params)

    respond_to do |format|
      if @carousel_item.save
        format.html { redirect_to @carousel_item, notice: 'Carousel item was successfully created.' }
        format.json { render :show, status: :created, location: @carousel_item }
      else
        format.html { render :new }
        format.json { render json: @carousel_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carousel_items/1
  # PATCH/PUT /carousel_items/1.json
  def update
    respond_to do |format|
      if @carousel_item.update(carousel_item_params)
        format.html { redirect_to @carousel_item, notice: 'Carousel item was successfully updated.' }
        format.json { render :show, status: :ok, location: @carousel_item }
      else
        format.html { render :edit }
        format.json { render json: @carousel_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carousel_items/1
  # DELETE /carousel_items/1.json
  def destroy
    @carousel_item.destroy
    respond_to do |format|
      format.html { redirect_to carousel_items_url, notice: 'Carousel item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel_item
      @carousel_item = CarouselItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carousel_item_params
      params.require(:carousel_item).permit(:itemtype, :caption, :sourceurl, :description, :gotourl, :position, :localphoto)
    end
end
