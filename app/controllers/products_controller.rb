class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @product = Product.all
    # @shipping_burden = ShippingBurden.find_by(id: @product.shipping_burden_id)

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

  private

  def product_params
    params.require(:product).permit(:product_name, :product_discription, :product_category_id, :product_condition_id, :shipping_burden_id, :shipping_area_id, :days_to_ship_id, :image, :purchase_price).merge(user_id: current_user.id)
  end

end
