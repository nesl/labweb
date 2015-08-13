class ResearchAreasController < ApplicationController
  before_action :set_research_area, only: [:show, :edit, :update, :destroy]

  # GET /research_areas
  # GET /research_areas.json
  def index
    @research_areas = ResearchArea.all
  end

  # GET /research_areas/1
  # GET /research_areas/1.json
  def show
  end

  # GET /research_areas/new
  def new
    @research_area = ResearchArea.new
  end

  # GET /research_areas/1/edit
  def edit
  end

  # POST /research_areas
  # POST /research_areas.json
  def create
    @research_area = ResearchArea.new(research_area_params)

    respond_to do |format|
      if @research_area.save
        format.html { redirect_to @research_area, notice: 'Research area was successfully created.' }
        format.json { render :show, status: :created, location: @research_area }
      else
        format.html { render :new }
        format.json { render json: @research_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_areas/1
  # PATCH/PUT /research_areas/1.json
  def update
    respond_to do |format|
      if @research_area.update(research_area_params)
        format.html { redirect_to @research_area, notice: 'Research area was successfully updated.' }
        format.json { render :show, status: :ok, location: @research_area }
      else
        format.html { render :edit }
        format.json { render json: @research_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_areas/1
  # DELETE /research_areas/1.json
  def destroy
    @research_area.destroy
    respond_to do |format|
      format.html { redirect_to research_areas_url, notice: 'Research area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_area
      @research_area = ResearchArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_area_params
      params.require(:research_area).permit(:name, :description)
    end
end
