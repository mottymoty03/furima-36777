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
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'area_info_idが空では購入できない' do
        @purchase_shipping_address.area_info_id = 0
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Area info can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @purchase_shipping_address.municipality = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @purchase_shipping_address.house_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では購入できない' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いてなければ購入できない' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いてなければ購入できない' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeがハイフンなしではでは購入できない' do
        @purchase_shipping_address.postal_code = '0000000'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが半角数字でなければ購入できない' do
        @purchase_shipping_address.postal_code = '０００-００００'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberがハイフンがあると購入できない' do
        @purchase_shipping_address.phone_number = '090-1111-2222'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角数字でなければ購入できない' do
        @purchase_shipping_address.phone_number = '０９０１１１１２２２２'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @purchase_shipping_address.phone_number = '090456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_shipping_address.phone_number = '090456789012'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end