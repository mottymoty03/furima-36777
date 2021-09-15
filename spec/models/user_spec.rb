require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "必要な情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができる" do

      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
      it 'passwordが空では登録できない' do
        # passwordが空では登録できないテストコードを記述します
      end
      it 'lastnameが空では登録できない' do
        # lastnameが空では登録できないテストコードを記述します
      end
      it 'firstnameが空では登録できない' do
        # firstnameが空では登録できないテストコードを記述します
      end
      it 'lastname_kanaが空では登録できない' do
        # lastname_kanaが空では登録できないテストコードを記述します
      end
      it 'firstname_kanaが空では登録できない' do
        # firstname_kanaが空では登録できないテストコードを記述します
      end
      it 'birthdayが空では登録できない' do
        # birthdayが空では登録できないテストコードを記述します
      end
      it 'emailが一意性であること' do
        # emailが
      end
      it 'emailは@を含む必要があること' do
        # emailが
      end
      it 'passwordは6文字以上での入力が必須であること' do
        # passwordが
      end
      it 'passwordは半角英数字混合での入力が必須であること' do
        # passwordが
      end
      it 'passwordとpassword（確認）の値の一致が必須であること' do
        # passwordが
      end
      it 'lastnameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        # lastnameが
      end
      it 'firstnameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        # firstnameが
      end
      it 'lastname_kanaは全角（カタカナ）での入力が必須であること' do
        # lastname_kanaが
      end
      it 'firstname_kanaは全角（カタカナ）での入力が必須であること' do
        # firstname_kanaが
      end
    end
  end
  describe 'ログイン' do
    context 'ログインできる場合' do
      it "必要な情報を適切に入力して「ログイン」ボタンを押すと、ユーザーのログインができる" do

      end
    end
    context 'ログインできない場合' do
      it 'emailが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
      it 'passwordが空では登録できない' do
        # passwordが空では登録できないテストコードを記述します
      end
    end
  end
end
