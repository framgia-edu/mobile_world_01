class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :find_user, only: %i(:show)

  def index; end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "controllers.users_controller.success"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :username, :address, :email,
      :phone_number, :password, :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "controllers.users_controller.not_found"
    redirect_to root_path
  end

  def logged_in_user
    return if logged_in?
    flash.now[:danger] = t "controllers.application_controllers.login_check"
    redirect_to login_url
  end
end
