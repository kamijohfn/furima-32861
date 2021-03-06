require 'rails_helper'

RSpec.describe PurchaserDelivery, type: :model do

  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item) 
    @purchaser_delivery = FactoryBot.build(:purchaser_delivery, user_id: @user, item_id: @item)
  end

  describe '商品購入機能' do

    context '商品の購入ができる' do
      it '全ての項目を正しく入力すると登録できる' do
        expect(@purchaser_delivery).to be_valid
      end

      it '建物名がなくても登録できる' do
        @purchaser_delivery.building_name = ''
        expect(@purchaser_delivery).to be_valid
      end

    end

    context '商品の購入ができない'do

      it '郵便番号が空だと購入できない' do
        @purchaser_delivery.postal_code = ''
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it'郵便番号にはハイフンが必要であること'do
        @purchaser_delivery.postal_code = '1234567'
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Postal code is invalid")
      end

      it'都道府県が空だと購入できない'do
        @purchaser_delivery.area_id  = ''
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it'都道府県がないと購入できない'do
        @purchaser_delivery.area_id  = 1
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Area must be other than 1")
      end

      it'市町村が空だと購入できない'do
        @purchaser_delivery.municipality  = ''
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Municipality can't be blank")
      end

      it'番地が空だと購入できない'do
        @purchaser_delivery.address  = ''
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it'電話番号が空だと購入できない'do
        @purchaser_delivery.phone_number  = ''
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it'電話番号は11桁以内であること'do
        @purchaser_delivery.phone_number  = '1234567891011'
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Phone number is invalid")
      end

      it'電話番号が英数混合だと登録できない'do
        @purchaser_delivery.phone_number  = '123456abcde'
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では購入できないこと" do
        @purchaser_delivery.token = nil
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it "use_idが空では登録できない" do
        @purchaser_delivery.user_id = nil
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できない" do
        @purchaser_delivery.item_id = nil
        @purchaser_delivery.valid?
        expect(@purchaser_delivery.errors.full_messages).to include("Item can't be blank")
      end

    end


  end


end
