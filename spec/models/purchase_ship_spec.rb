require 'rails_helper'

RSpec.describe PurchaseShip, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    sleep 0.1
    @purchase_ship = FactoryBot.build(:purchase_ship, user_id: user.id, product_id: product.id)
  end

  describe '商品購入情報入力' do
    context '商品購入情報入力できる場合' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@purchase_ship).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_ship.building = ''
        expect(@purchase_ship).to be_valid
      end
    end

    context '商品購入情報入力できない場合' do
      it '郵便番号が必須であること' do
        @purchase_ship.postal_code = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include("Postal code can't be blank")
      end

      # it 'buildingが必須であること' do
      #   @purchase_ship.building = ''
      #   @purchase_ship.valid?
      #   expect(@purchase_ship.errors.full_messages).to include("Product can't be blank")
      # end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_ship.postal_code = '158077'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が必須であること' do
        @purchase_ship.shipping_area_id = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '都道府県に「--」が選択されていないこと' do
        @purchase_ship.shipping_area_id = '--'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Shipping area is not included in the list')
      end

      it '市町村が必須であること' do
        @purchase_ship.city = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること。' do
        @purchase_ship.street = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が必須であること' do
        @purchase_ship.phone = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号は、11桁以内の半角数値のみ' do
        @purchase_ship.phone = '0753945333333'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end

      it '電話番号は、10桁以上の半角数値のみ' do
        @purchase_ship.phone = '200'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Phone is too short (minimum is 10 characters)')
      end

      it 'tokenが必須であること' do
        @purchase_ship.token = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
