class PurchasesController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @Purchase_ship = PurchaseShip.new
  end
end
