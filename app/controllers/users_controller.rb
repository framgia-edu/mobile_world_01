class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.all.page(params[:page]).per Settings.paginate_size
  end

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

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controllers.users_controller.updated_profile"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to users_url
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
    redirect_to root_url
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash.now[:danger] = t "controllers.application_controllers.login_check"
    redirect_to login_url
  end

  def correct_user
    redirect_to root_url unless current_user.current_user?(@user) || current_user.admin?
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
