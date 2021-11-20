class PurchasesController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase_ship = PurchaseShip.new
    @product = Product.find(params[:product_id])
  end

    def create

    @purchase_ship = PurchaseShip.new(purchase_params)
    @product = Product.find(params[:product_id])
    binding.pry
    if @purchase_ship.valid?

      Payjp.api_key = "sk_test_b6972280ab4602f6e381b461"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        # amount: purchase_params[:purchase_price],  # 商品の値段
        amount: @product.purchase_price,
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )

      @purchase_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:postal_code,:shipping_area_id,:city,:street,:building, :phone, :product_id, :purchase_price).merge(user_id: current_user.id, token: params[:token])
  end

end
