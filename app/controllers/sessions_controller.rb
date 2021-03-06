class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by username: params[:session][:username].downcase
    if @user&.authenticate params[:session][:password]
      log_in @user
      remember_user
      redirect_back_or root_url
    else
      flash.now[:danger] = t "controllers.sessions_controller.invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def remember_user
    params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
  end
end
