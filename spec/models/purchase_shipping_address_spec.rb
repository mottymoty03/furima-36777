require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  describe '購入情報入力' do
    context '購入できる場合' do
      it "必要な情報を入力して「購入」ボタンを押すと、購入ができる" do
        expect(@purchase_shipping_address).to be_valid
      end
      it "buildingnameは空でも購入できる" do
        @purchase_shipping_address.buildingname = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'area_info_idが空では購入できない' do
        @purchase_shipping_address.area_info_id = 1
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'municipalityが空では購入できない' do
        @purchase_shipping_address.municipality = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空では購入できない' do
        @purchase_shipping_address.house_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'tokenが空では購入できない' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("トークンを入力してください")
      end
      it 'userが紐付いてなければ購入できない' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("出品者を入力してください")
      end
      it 'itemが紐付いてなければ購入できない' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("商品を入力してください")
      end
      it 'postal_codeがハイフンなしではでは購入できない' do
        @purchase_shipping_address.postal_code = '0000000'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("郵便番号は不正な値かハイフン（-）が含まれていません")
      end
      it 'postal_codeが半角数字でなければ購入できない' do
        @purchase_shipping_address.postal_code = '０００-００００'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("郵便番号は不正な値かハイフン（-）が含まれていません")
      end
      it 'phone_numberがハイフンがあると購入できない' do
        @purchase_shipping_address.phone_number = '090-1111-2222'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが半角数字でなければ購入できない' do
        @purchase_shipping_address.phone_number = '０９０１１１１２２２２'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @purchase_shipping_address.phone_number = '090456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_shipping_address.phone_number = '090456789012'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end