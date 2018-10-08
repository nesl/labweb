class DocumentCategoriesController < ApplicationController
  before_action :authenticate_user!, only_member_actions: true
  before_action :set_document_category, only: [:show, :edit, :update, :destroy]

  # GET /document_categories
  # GET /document_categories.json
  def index
    @document_categories = DocumentCategory.order(:priority)
  end

  # GET /document_categories/1
  # GET /document_categories/1.json
  def show
  end

  # GET /document_categories/new
  def new
    @document_category = DocumentCategory.new
  end

  # GET /document_categories/1/edit
  def edit
  end

  # POST /document_categories
  # POST /document_categories.json
  def create
    model_attributes = document_category_params
    model_attributes['priority'] = DocumentCategory.count()
    @document_category = DocumentCategory.new(model_attributes)

    respond_to do |format|
      if @document_category.save
        format.html { redirect_to document_categories_url, notice: 'Document category was successfully created.' }
        format.json { render :show, status: :created, location: @document_category }
      else
        format.html { render :new }
        format.json { render json: @document_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_categories/1
  # PATCH/PUT /document_categories/1.json
  def update
    respond_to do |format|
      if @document_category.update(document_category_params)
        format.html { redirect_to @document_category, notice: 'Document category was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_category }
      else
        format.html { render :edit }
        format.json { render json: @document_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_categories/1
  # DELETE /document_categories/1.json
  def destroy
    @document_category.destroy
    respond_to do |format|
      format.html { redirect_to document_categories_url, notice: 'Document category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /document_categories/reorder
  def reorder
    @document_categories = DocumentCategory.order(:priority)
  end
  
  # POST /document_categories/reorder_submit
  def reorder_submit
    ids = params['order'].split(",").map { |s| s.to_i }
    if !check_document_category_id_coverage(ids)
      respond_to do |format|
        Rails.logger.debug("block due to bad coverage")
        format.html { redirect_to document_categories_url, error: 'Internal error, order update failed' }
        format.json { render :index, status: :ok }
      end
      return
    end

    ids.each_with_index {|id, index|
      dc = DocumentCategory.find(id)
      dc.priority = index
      dc.save()
    }

    respond_to do |format|
      Rails.logger.debug("Still come to good part")
      format.html { redirect_to document_categories_url, notice: 'Document category order updated' }
      format.json { render :index, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_category
      @document_category = DocumentCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_category_params
      params.require(:document_category).permit(:name)
    end

    def check_document_category_id_coverage(ids)
      existing_document_category_ids = Set[]
      DocumentCategory.all.each do |dc|
        existing_document_category_ids.add(dc.id)
      end

      passed_ids = Set[]
      ids.each do |id|
        passed_ids.add(id)
      end

      return existing_document_category_ids == passed_ids
    end
end
