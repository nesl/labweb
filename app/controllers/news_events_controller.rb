class NewsEventsController < ApplicationController
  before_action :set_news_event, only: [:show, :edit, :update, :destroy]

  # GET /news_events
  # GET /news_events.json
  def index
    @news_events = NewsEvent.all
  end

  # GET /news_events/1
  # GET /news_events/1.json
  def show
  end

  # GET /news_events/new
  def new
    @news_event = NewsEvent.new
  end

  # GET /news_events/1/edit
  def edit
  end

  # POST /news_events
  # POST /news_events.json
  def create
    @news_event = NewsEvent.new(news_event_params)

    respond_to do |format|
      if @news_event.save
        format.html { redirect_to @news_event, notice: 'News event was successfully created.' }
        format.json { render :show, status: :created, location: @news_event }
      else
        format.html { render :new }
        format.json { render json: @news_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_events/1
  # PATCH/PUT /news_events/1.json
  def update
    respond_to do |format|
      if @news_event.update(news_event_params)
        format.html { redirect_to @news_event, notice: 'News event was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_event }
      else
        format.html { render :edit }
        format.json { render json: @news_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_events/1
  # DELETE /news_events/1.json
  def destroy
    @news_event.destroy
    respond_to do |format|
      format.html { redirect_to news_events_url, notice: 'News event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_event
      @news_event = NewsEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_event_params
      params.require(:news_event).permit(:title, :description, :date)
    end
end
