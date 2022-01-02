class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :move_to_index_three, only: [:edit]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @product.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_discription, :product_category_id, :product_condition_id,
                                    :shipping_burden_id, :shipping_area_id, :days_to_ship_id, :image, :purchase_price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @product.user_id
  end

  def move_to_index_three
    redirect_to root_path if @product.purchase.present? && user_signed_in? && (current_user.id == @product.user_id)
  end
end
