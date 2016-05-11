class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    begin
      authorize User
    rescue Pundit::NotAuthorizedError
      redirect_to '/', alert: "Your permission does not allow access to this page"
    end
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    begin
      authorize @user
    rescue Pundit::NotAuthorizedError
      redirect_to '/', alert: "Your permission does not allow access to this page"
    end
  end

  # GET /users/new
  def new
    begin
      authorize User
    rescue Pundit::NotAuthorizedError
      redirect_to '/', alert: "Your permission does not allow access to this page"
    end
    @user = User.new
  end

  # TODO: After a user is created, the current user will shift to this new user,
  #       which instead shouldn't change (i.e., still an admin.) Keep an eye
  #       on this thread: http://stackoverflow.com/questions/36948400/devise-for-how-should-we-do-so-that-only-admin-can-create-normal-users
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    begin
      authorize User
    rescue Pundit::NotAuthorizedError
      redirect_to '/', alert: "Your permission does not allow access to this page"
    end
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    begin
      authorize User
    rescue Pundit::NotAuthorizedError
      redirect_to '/', alert: "Your permission does not allow access to perform this action"
    end
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
