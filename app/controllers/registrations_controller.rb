class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  prepend_before_action :authenticate_scope!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:new, :create]

  def new
    super
  end

  protected

  def sign_up(resource_name, resource)
    # Don't sign_in()
  end

  private

  def authorize_user!
    if !current_user || !current_user.admin?
      redirect_to '/', notice: "Your permissions do not allow access to this page"
    end
  end

end
