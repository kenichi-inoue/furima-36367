class PurchasesController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase_ship = PurchaseShip.new
  end

  def create
    @purchase_ship = PurchaseShip.new(purchase_params)
    if @purchase_ship.valid?
      @purchase_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:postal_code,:shipping_area_id,:city,:street,:building, :phone, :product_id).merge(user_id: current_user.id)
  end

end
