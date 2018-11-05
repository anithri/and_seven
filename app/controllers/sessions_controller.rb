class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to pages_home_path
    end
  end

  def create
    authenticated = Session::Login.call params: login_params
    if authenticated.success?
      flash.now[:notice] = authenticated.notice
      log_in authenticated.user
      remember authenticated.user
      redirect_back_or_to pages_home_path
    else flash.now[:danger] = authenticated.error
    render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def login_params
    params.require(:session).permit(:email, :password)
  end
end
