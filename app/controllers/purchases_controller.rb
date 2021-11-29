class PurchasesController < ApplicationController
  before_action :set_product_id, only: [:index, :create]
  before_action :move_to_index_two, only: [:index]

  def index
    @purchase_ship = PurchaseShip.new
  end

  def create
    @purchase_ship = PurchaseShip.new(purchase_params)
    # binding.pry
    if @purchase_ship.valid?
      pay_item
      @purchase_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_ship).permit(:postal_code, :shipping_area_id, :city, :street, :building, :phone,:purchase_price).merge(
      user_id: current_user.id, token: params[:token], product_id: params[:product_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    Payjp::Charge.create(
      amount: @product.purchase_price,
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_product_id
    @product = Product.find(params[:product_id])
  end

  def move_to_index_two
    return redirect_to new_user_session_path unless user_signed_in?
    return redirect_to root_path if @product.purchase.present?
    redirect_to root_path if current_user.id == @product.user_id
  end

end
