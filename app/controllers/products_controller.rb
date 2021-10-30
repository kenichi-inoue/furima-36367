class ProductsController < ApplicationController

  def index
    # @product = Product.all
  end

  def new
    @product = Product.new
  end

end
