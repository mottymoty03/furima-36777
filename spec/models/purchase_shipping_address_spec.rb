require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
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
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal_code can't be blank")
      end
      it 'area_info_idが空では購入できない' do
        @purchase_shipping_address.area_info_id = 0
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Area_info_id can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @purchase_shipping_address.municipality = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @purchase_shipping_address.house_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("House_number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone_number can't be blank")
      end
      it 'userが紐付いてなければ購入できない' do
        @purchase_shipping_address.user_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User must exist")
      it 'itemが紐付いてなければ購入できない' do
        @purchase_shipping_address.item_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item must exist")
      end
      it 'postal_codeがハイフンなしではでは購入できない' do
        @purchase_shipping_address.postal_code = '0000000'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal_code is invalid")
      end
      it 'postal_codeが半角数字でなければ購入できない' do
        @purchase_shipping_address.postal_code = '０００-００００'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal_code is invalid")
      end
      it 'phone_numberがハイフンがあると購入できない' do
        @purchase_shipping_address.phone_number = '090-1111-2222'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone_number is invalid")
      end
      it 'phone_numberが半角数字でなければ購入できない' do
        @purchase_shipping_address.phone_number = '０９０１１１１２２２２'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone_number is invalid")
      end
    end
  end
end
