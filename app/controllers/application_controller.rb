class ApplicationController < ActionController::Base
  GUEST_CONTROLLERS = ['sessions']
  protect_from_forgery with: :null_session
  include Authentication
  before_action :require_login

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end
end
