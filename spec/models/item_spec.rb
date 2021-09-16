require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it "必要な情報を適切に入力して「出品」ボタンを押すと、商品情報の登録ができる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it "画像なしでは出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "itemnameが空では出品できない" do
        @item.itemname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemname can't be blank")
      end
      it "itemdescriptionが空では出品できない" do
        @item.itemdescription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemdescription can't be blank")
      end
      it "category_idを選択しないと出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "itemstatus_idを選択しないと出品できない" do
        @item.itemstatus_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemstatus can't be blank")
      end
      it "burden_idを選択しないと出品できない" do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it "area_info_idを選択しないと出品できない" do
        @item.area_info_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area info can't be blank")
      end
      it "days_to_send_idを選択しないと出品できない" do
        @item.days_to_send_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to send can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299円以下では出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "priceが10000000円以上では出品できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end
