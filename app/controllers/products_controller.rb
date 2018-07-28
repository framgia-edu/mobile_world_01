class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :edit, :update, :destroy]
  before_action :find_product, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all.page(params[:page]).per Settings.paginate_size
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".add_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit :name, :category_id, :manufacture_id,
      :picture, :description, :price, :quantity
  end

  def find_product
    @product = Product.find_by id: params[:id]
    
    return if @product
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash.now[:danger] = t "controllers.application_controllers.login_check"
    redirect_to login_url
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
