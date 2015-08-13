class PersonCategoriesController < ApplicationController
  before_action :set_person_category, only: [:show, :edit, :update, :destroy]

  # GET /person_categories
  # GET /person_categories.json
  def index
    @person_categories = PersonCategory.all
  end

  # GET /person_categories/1
  # GET /person_categories/1.json
  def show
  end

  # GET /person_categories/new
  def new
    @person_category = PersonCategory.new
  end

  # GET /person_categories/1/edit
  def edit
  end

  # POST /person_categories
  # POST /person_categories.json
  def create
    @person_category = PersonCategory.new(person_category_params)

    respond_to do |format|
      if @person_category.save
        format.html { redirect_to @person_category, notice: 'Person category was successfully created.' }
        format.json { render :show, status: :created, location: @person_category }
      else
        format.html { render :new }
        format.json { render json: @person_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_categories/1
  # PATCH/PUT /person_categories/1.json
  def update
    respond_to do |format|
      if @person_category.update(person_category_params)
        format.html { redirect_to @person_category, notice: 'Person category was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_category }
      else
        format.html { render :edit }
        format.json { render json: @person_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_categories/1
  # DELETE /person_categories/1.json
  def destroy
    @person_category.destroy
    respond_to do |format|
      format.html { redirect_to person_categories_url, notice: 'Person category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_category
      @person_category = PersonCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_category_params
      params.require(:person_category).permit(:name, :relationship_distance)
    end
end
