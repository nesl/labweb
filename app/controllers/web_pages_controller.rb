class WebPagesController < ApplicationController
  # TODO: authenticate private pages
  #before_action :authenticate_user!, except: [:index]
  before_action :set_web_page, only: [:show, :edit, :update, :destroy]

  # GET /web_pages
  # GET /web_pages.json
  def index
    @web_pages = WebPage.all
  end

  def home
    @overview = WebPage.where("pagetitle='Overview'").first
    @carousel_items = CarouselItem.where("position > 0")
    @recent_pubs = Document.order(pubdate: :desc).first(ENV["RECENT_DOCS_COUNT"].to_i)
    @recent_news = NewsEvent.order(date: :desc).first(ENV["RECENT_NEWS_COUNT"].to_i)
    @select_projects = Project.where("isactive=true").order(id: :desc).first(ENV["RECENT_PROJS_COUNT"].to_i)
  end

  # GET /web_pages/1
  # GET /web_pages/1.json
  def show
  end

  # GET /web_pages/new
  def new
    @web_page = WebPage.new
  end

  # GET /web_pages/1/edit
  def edit
  end

  # POST /web_pages
  # POST /web_pages.json
  def create
    @web_page = WebPage.new(web_page_params)

    respond_to do |format|
      if @web_page.save
        format.html { redirect_to @web_page, notice: 'Web page was successfully created.' }
        format.json { render :show, status: :created, location: @web_page }
      else
        format.html { render :new }
        format.json { render json: @web_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_pages/1
  # PATCH/PUT /web_pages/1.json
  def update
    respond_to do |format|
      if @web_page.update(web_page_params)
        format.html { redirect_to @web_page, notice: 'Web page was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_page }
      else
        format.html { render :edit }
        format.json { render json: @web_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_pages/1
  # DELETE /web_pages/1.json
  def destroy
    @web_page.destroy
    respond_to do |format|
      format.html { redirect_to web_pages_url, notice: 'Web page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def findone
    where_condition = {}
    params.each { |key, value| where_condition[key] = value if ["pagetitle","bartitle","id"].member?(key) }
    @web_page = WebPage.where(where_condition).first
    respond_to do |format|
        format.html { render :template => "web_pages/show" }
        format.json { render json: @web_page}
    end
  end
  
  def findall
    where_condition = {}
    params.each { |key, value| where_condition[key] = value if ["pagetitle","bartitle","id"].member?(key) }
    @web_pages = WebPage.where(where_condition)
    respond_to do |format|
        format.html { render :template => "web_pages/index" }
        format.json { render json: @web_pages}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_page
      @web_page = WebPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_page_params
      params.require(:web_page).permit(:pagetitle, :bartitle, :body, :ispublic, :url)
    end
    
    
end
