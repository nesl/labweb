class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    # TODO: if the document category or main research area are not chosen,
    # the form validator will pass, but it will crash here
    # TODO: more optimization: http://stackoverflow.com/questions/12400860/activerecord-includes-specify-included-columns
    #@documents = Document.includes(:people).all.order('pubdate DESC')
    @documents = Document.order(pubdate: :desc)

    #Rails.logger.debug(@documents.to_sql)
    
    @document_categories = DocumentCategory.all.select{ |dc|
      @documents.where(:document_category => dc).any?
    }
    
    #Rails.logger.debug("doc_controller: document_categories=#{@document_categories.inspect}")
    person_id = nil
    params.each {|key, value| person_id = value if key=="person_id"}    
    if person_id.present? 
      @person = Person.find(person_id)
      # @documents = @documents.select {|d| d.people.member?(@person)}
    else
      @person = nil
    end


    # Sort the document list
    display_order_raw = eval(ENV["DOCUMENT_DISPLAY_ORDER"])
    display_order_all = display_order_raw.map{|x| x[0]!='-'? x : x[1..-1]}
    @document_categories.sort!{ |a,b|
      a_index = display_order_all.find_index(a.name)
      b_index = display_order_all.find_index(b.name)
      a_index = display_order_raw.length+1 unless a_index.present?
      b_index = display_order_raw.length+1 unless b_index.present?
      a_index<=>b_index
    }

    # Filter category names for display
    filter = true    
    params.each { |key, value| filter = false if key=="all" }
    
    if filter 
      display_order_filtered = display_order_raw.select{ |x| x if x[0]!='-'}
      @document_categories = @document_categories.select { |x| display_order_filtered.member?(x.name)}
    end

  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
    @document_person_maps = @document.document_person_maps.build(rank: 0)
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
    params.require(:document).permit(
        :tryear, :trmonth, :trnumber,
        :title, :abstract,
        :paperupload, :slidesupload, :avmediaupload, :othersupload,
        :urlextpaper, :urldoi, :urlpublisher, :urlgooglescholar, :urlciteseer,
        :pubin, :pubvol, :pubnum, :pubnum_end, :pubpagefirst, :pubpagelast,
        :pubpagecount, :pubdate, :pubdate_end, :pubplace, :publisher,
        :ispublic, :islabdocument, :miscattributes,
        :document_category_id, :main_research_area_id,
        document_person_maps_attributes: [:id, :person_id, :rank, :_destroy])
  end

end
