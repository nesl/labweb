class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    @document_categories = DocumentCategory.all
    person_id = nil
    params.each {|key, value| person_id = value if key=="person_id"}    
    if person_id.present? 
      @person = Person.find(person_id)
      # @documents = @documents.select {|d| d.people.member?(@person)}
    else
      @person = nil
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:tryear, :trmonth, :trnumber, :title, :abstract, :filename, :file, :urlpdfpaper, :urlsrcpaper, :urlpdfpresentation, :urlsrcpresentation, :urlavmedia, :urldoi, :urlpublisher, :urlgooglescholar, :urlciteseer, :pubin, :pubvol, :pubnum, :pubnum_end, :pubpagefirst, :pubpagelast, :pubpagecount, :pubdate, :pubdate_end, :pubplace, :publisher, :ispublic, :islabdocument, :miscattributes, :document_category_id, :main_research_area_id)
    end
end