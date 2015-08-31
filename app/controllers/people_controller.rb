class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    @person_categories = PersonCategory.all.map{|x| x.name}.select{ |x| 
      @people.select{ |p|
        p.person_category.name==x
      }.length>0
    }
    display_order_raw = eval(ENV["PEOPLE_DISPLAY_ORDER"])
    display_order_all = display_order_raw.map{|x| x[0]!='-'? x : x[1..-1]}
    @person_categories.sort!{ |a,b|
      a_index = display_order_all.find_index(a)
      b_index = display_order_all.find_index(b)
      a_index = display_order_raw.length+1 unless a_index.present?
      b_index = display_order_raw.length+1 unless b_index.present?
      a_index<=>b_index
    }
            
    filter = true    
    params.each { |key, value| filter = false if key=="all" }
    
    if filter 
      display_order_filtered = display_order_raw.select{|x| x if x[0]!='-'}
      @person_categories = @person_categories.select { |x| display_order_filtered.member?(x)}
      @people = Person.all.select{|p| p.person_category.name}
    end
    
    #byebug
    
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:lastname, :firstname, :middleinitial, :webname, :email, :url, :urlphoto, :phonework, :phonehome, :phonecell, :fax, :addressoffice, :addresslab, :addressmail, :department, :urldepartment, :organization, :urlorganization, :biography, :researchinterests, :education, :professionalexperience, :professionalservice, :otherpublications, :patents, :awards, :skills, :interests, :secretary, :bs_year, :bs_title, :bs_school, :bs_field, :bs_in_lab, :ms_year, :ms_title, :ms_school, :ms_field, :ms_thesis, :ms_in_lab, :phd_year, :phd_title, :phd_school, :phd_field, :phd_thesis, :phd_in_lab, :miscattributes, :person_category_id)
    end
end
