class DocumentPersonMapsController < ApplicationController
  before_action :set_document_person_map, only: [:show, :edit, :update, :destroy]

  # GET /document_person_maps
  # GET /document_person_maps.json
  def index
    @document_person_maps = DocumentPersonMap.all
  end

  # GET /document_person_maps/1
  # GET /document_person_maps/1.json
  def show
  end

  # GET /document_person_maps/new
  def new
    @document_person_map = DocumentPersonMap.new
  end

  # GET /document_person_maps/1/edit
  def edit
  end

  # POST /document_person_maps
  # POST /document_person_maps.json
  def create
    @document_person_map = DocumentPersonMap.new(document_person_map_params)

    respond_to do |format|
      if @document_person_map.save
        format.html { redirect_to @document_person_map, notice: 'Document person map was successfully created.' }
        format.json { render :show, status: :created, location: @document_person_map }
      else
        format.html { render :new }
        format.json { render json: @document_person_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_person_maps/1
  # PATCH/PUT /document_person_maps/1.json
  def update
    respond_to do |format|
      if @document_person_map.update(document_person_map_params)
        format.html { redirect_to @document_person_map, notice: 'Document person map was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_person_map }
      else
        format.html { render :edit }
        format.json { render json: @document_person_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_person_maps/1
  # DELETE /document_person_maps/1.json
  def destroy
    @document_person_map.destroy
    respond_to do |format|
      format.html { redirect_to document_person_maps_url, notice: 'Document person map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_person_map
      @document_person_map = DocumentPersonMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_person_map_params
      params.require(:document_person_map).permit(:document_id, :person_id, :rank)
    end
end
