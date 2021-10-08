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
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "itemnameが空では出品できない" do
        @item.itemname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "itemdescriptionが空では出品できない" do
        @item.itemdescription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it "category_idを選択しないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "itemstatus_idを選択しないと出品できない" do
        @item.itemstatus_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "burden_idを選択しないと出品できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("送料の負担を入力してください")
      end
      it "area_info_idを選択しないと出品できない" do
        @item.area_info_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it "days_to_send_idを選択しないと出品できない" do
        @item.days_to_send_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発想までの日数を入力してください")
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it "priceが299円以下では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it "priceが10000000円以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it "priceが半角数字でなければ出品できない" do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it '出品者がいない出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品者を入力してください')
      end
    end
  end
end
