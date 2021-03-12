require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context 'ユーザー登録ができる時' do
      
      it '全ての項目を入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do

      it 'emailには＠が含まれていないと登録できない' do
        @user.email = 'aassdf'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録はできない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'passwordは6文字以下では登録できない'do
      @user.password = '123qw'
      @user.password_confirmation = '123qw'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordは半角英数字混合での入力が必須であること'do
      @user.password = 1234567
      @user.password_confirmation = 1234567
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない'do
      @user.password = '123qwer'
      @user.password_confirmation = '123qwrr'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは半角英語のみは登録できない' do
      @user.password = 'aaabbb'
      @user.password_confirmation = 'aaabbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end

      it 'passwordは全角英数字混合での登録はできない'do
      @user.password = '１１１１ＭＭＭ'
      @user.password_confirmation = '１１１１ＭＭＭ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end

      it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角でなければ登録できない' do
      @user.last_name = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角でなければ登録できない' do
      @user.first_name = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana = '言語'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end

      it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end

      it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end

  end
end
